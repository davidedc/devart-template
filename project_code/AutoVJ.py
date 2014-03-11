#!/usr/bin/python
from __future__ import absolute_import, division, print_function, unicode_literals
""" Interactive Playful Geometries """

MASTER = True # master plays the music and runs the flask server
#MASTER = False 
#MARGIN = 0
MARGIN = 200 # for debugging make the screen small enough to see round!

import demo
import pi3d
import random, time, glob, json

from subprocess import Popen, PIPE, STDOUT
from multiprocessing import Process, Queue
from flask import Flask, render_template, request

from threading import Thread

from Background import Background
from Colors import Colors
from Presets import preset, fields, samples
from AnimationState import AnimationState
from SimpleShapes import SimpleCube, SimpleSphere, SimplePoints
from ShaderTypes import ShaderTypes

def slave_checker(ani_state, t_flag):
  while True:
    if t_flag[0] == -1:
      t_flag[0] = 0
      response = urllib2.urlopen('http://192.168.1.2/update/?msg={}')
      """obviously this has to be set to the address of the server"""
      html = response.read()
      msg = json.loads(html)
      for key in msg:
        k_chk = key[1:5]
        if k_chk != '_rot' and ani_state.state[key] != msg[key]:
          t_flag[0] = 1
        ani_state.state[key] = msg[key]
    time.sleep(0.1) #could cause delay if flag has changed to -1 but can't run flat out!
    

counter = [None]*5
counter[0] = 0

if MASTER:
  DISPLAY = pi3d.Display.create(x=MARGIN, y=MARGIN)
else:
  DISPLAY = pi3d.Display.create(x=MARGIN, y=MARGIN, frames_per_second=20)

ShaderTypes()

mykeys = pi3d.Keyboard()

perspectiveCamera = pi3d.Camera(is_3d=True)
#perspectiveCamera.rotateY(-65)

box = SimpleCube(perspectiveCamera)
points = SimplePoints(perspectiveCamera)
sphere = SimpleSphere(perspectiveCamera)
foreground = box
background = Background(perspectiveCamera)

animation_state = AnimationState()

if MASTER:
  #### server process and queue
  app = Flask(__name__)
  queue_down = Queue()
  queue_up = Queue()
  STATE = {}
  IPLIST = {}

  @app.route("/")
  def hello():
    templateData = {'fields': fields} 
    return render_template('main.html', **templateData)

  @app.route("/update/")
  def update():
    global STATE, IPLIST
    msg = request.args['msg']
    this_ip = request.remote_addr
    queue_up.put(json.loads(msg))
    if not queue_down.empty():
      STATE = queue_down.get()
      for ip in IPLIST:
        IPLIST[ip] = False
    if not (this_ip  in IPLIST and IPLIST[this_ip] == True):
      IPLIST[this_ip] = True
      return json.dumps(STATE, separators=(',',':'))
    else:
      return '{}'

  def start_server():
    app.run(host='0.0.0.0', port=80, debug=False, use_reloader=False)

  p = Process(target=start_server)
  p.daemon = True
  p.start()

  ########### music ##########
  music = Popen(['mpg321', '-R', '-F', 'testPlayer'], stdout=PIPE, stdin=PIPE, stderr=STDOUT)
  music.stdin.write(b'LOAD music/' + animation_state.sample_progress() + b'\n')
  #############################
else: ## not MASTER so SLAVE!
  import urllib2
  t_flag = [0]
  #use this for flagging completion, has to be [] to pass by ref. 3 states:
  #-1 get state from MASTER, 1 fresh info returned, 0 with for next time
  t = Thread(target=slave_checker, args=(animation_state, t_flag))
  t.daemon = True
  t.start()

nextTime = time.time()

last_amp = 0
last_frame = 0
num_amp = 0
av_amp = 30
activity = 0
last_ftype = 'box'


while DISPLAY.loop_running():
  refresh = False #only send new state info to server subprocess if changed
  animation_state.updateTimeAndFrameCount()
  if MASTER:
    ####### music checking #######
    for i in range(10):
      """ Ideally there would be a better way of stopping hiccups than this.
      This loop has to read all the FFTs churned out since last loop
      which will probably depend on the sample rate but generally means
      a readline() is needed for every 0.005s of frame time period, so for
      15fps -> 13
      20fps -> 10
      30fps ->  7
      This step should always limit the fps rather than Display fps which
      should not be used
      """
      l = music.stdout.readline()
      if b'@P' in l:
        if activity > 10.0:
          animation_state.activity = 'l04'
        elif activity > 2.0:
          animation_state.activity = 'l03'
        elif activity > 0.1:
          animation_state.activity = 'l02'
        else:
          animation_state.activity = 'l01'
        music.stdin.write(b'LOAD music/' + animation_state.sample_progress() + b'\n')
        foreground = box
        animation_state.state['f_type'] = 'box'
        if  animation_state.activity == 'l04': # do after state reset
          sp = animation_state.state['f_speed']
          if sp > 8 and sp < 13:
            foreground = points
            animation_state.state['f_type'] = 'points'
          elif sp == 5 or sp == 18:
            foreground = sphere
            animation_state.state['f_type'] = 'sphere'
        refresh = True
    if b'FFT' in l: #frequency analysis
      val_str = l.split()
      amp = sum([int(i) for i in val_str[-3:]])
      av_amp = 0.95 * av_amp + 0.05 * amp
      if amp > av_amp and last_amp < av_amp:
        num_amp += 1
        if num_amp == 8: #8th beat, update timer
          animation_state.state['beatf'] = int(round((animation_state.frameCount -
                                                        last_frame) / 8.0))
          last_frame = animation_state.frameCount
          num_amp = 0
          animation_state.state['light'] = round(0.25 + min(0.75, av_amp / 150.0), 3)
          if time.time() > nextTime:
            animation_state.beat_progress()
            refresh = True
      last_amp = amp
    #######-----------------------
    ############ get input from tablets #########################
    #first check if anything has been sent and eat up to last one
    msg = None
    while not queue_up.empty():
      msg = queue_up.get()
    if msg: #there was someting in the queue so process it
      for mkey in msg:
        if mkey == 'preset_get':
          animation_state.jumpToPreset(msg[mkey])
        elif mkey == 'preset_set':
          animation_state.setPreset(msg[mkey])
        elif mkey == 'user1':
          animation_state.state['user1'] = [round(i / 255.0, 3) for i in msg[mkey]]
        elif mkey == 'user2':
          animation_state.state['user2'] = [round(i / 255.0, 3) for i in msg[mkey]]
        else:
          animation_state.state[mkey] = msg[mkey]
      nextTime = time.time() + 5.0
      activity += 1.0
      refresh = True
    #######------------------------  
    activity *= 0.9998 # slow fade if no input
    if refresh:
      ################# send state to slaves and tablets ########
      #clear it if nothing has consumed previous input to queue
      while not queue_down.empty():
        queue_down.get()
      animation_state.state['b_rot'] = [round(i, 1) for i in background.geometry.unif[3:6]]
      animation_state.state['f_rot'] = [round(i, 1) for i in foreground.geometry.unif[3:6]]
      queue_down.put(animation_state.state)
      #######----------------------

  else: ## not MASTER so SLAVE!
    if (animation_state.frameCount % 9) == 0:
      t_flag[0] = -1
    if t_flag[0] == 1: #fresh info returned by thread
      this_ftype = animation_state.state['f_type']
      if this_ftype != last_ftype:
        if this_ftype == 'points':
          foreground = points
        elif this_ftype == 'sphere':
          foreground = sphere
        else:
          foreground = box
        last_ftype = this_ftype
      background.geometry.rotateToX(animation_state.state['b_rot'][0])
      background.geometry.rotateToY(animation_state.state['b_rot'][1])
      background.geometry.rotateToZ(animation_state.state['b_rot'][2])
      foreground.geometry.rotateToX(animation_state.state['f_rot'][0])
      foreground.geometry.rotateToY(animation_state.state['f_rot'][1])
      foreground.geometry.rotateToZ(animation_state.state['f_rot'][2])
      t_flag[0] = 0

  foreground.draw(animation_state)
  background.draw(animation_state)

  theKey = mykeys.read()
  if theKey == 27: # esc
    break
  elif theKey >= 48 and theKey <= 57:
    animation_state.jumpToPreset(theKey - 48)

mykeys.close()
DISPLAY.destroy()
if MASTER:
  p.terminate()
  music.stdin.write(b'QUIT\n')

