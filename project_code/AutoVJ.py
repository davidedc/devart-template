#!/usr/bin/python
from __future__ import absolute_import, division, print_function, unicode_literals
""" Interactive Playful Geometries """

MASTER = True # master plays the music and runs the flask server
#MASTER = False 
MARGIN = 0
#MARGIN = 200 # for debugging make the screen small enough to see round!

import demo
import pi3d
import random, time, glob, json, os

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
      response = urllib2.urlopen('http://192.168.1.8/update/?msg={}')
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
  DISPLAY = pi3d.Display.create(x=MARGIN, y=MARGIN, frames_per_second=15)

ShaderTypes()

mykeys = pi3d.Keyboard()

perspectiveCamera = pi3d.Camera(is_3d=True)
#perspectiveCamera.rotateX(-5)
#perspectiveCamera.rotateY(35)

box = SimpleCube(perspectiveCamera)
points = SimplePoints(perspectiveCamera)
sphere = SimpleSphere(perspectiveCamera)
foreground = box
background = Background(perspectiveCamera)

animation_state = AnimationState()

if MASTER:
  #### server process and queue
  app = Flask(__name__)
  queue_down = Queue() # from main animation loop TO flask server
  queue_up = Queue()   # flask server TO animation
  STATE = {} # copy of animation state in the flask subprocess
  IPLIST = {} # to keep track of which requests need full update

  @app.route("/")
  def hello():
    """ default return a basic js page for interacting with the
    animation
    """
    templateData = {'fields': fields} 
    return render_template('main.html', **templateData)

  @app.route("/update/")
  def update():
    """ responds with json animation_state. It keeps a tag of which IP
    addresses have been responded to with the latest version of STATE
    and replies to requests with {}.
    If request has some alterations to state in json msg then STATE
    is altered in this subprocess as well as the alterations being piped
    to the main animation. IPLIST is set to ensure this and subsequent
    requests get the full STATE response.
    """
    global STATE, IPLIST
    msg = request.args['msg']
    this_ip = request.remote_addr
    state_mods = json.loads(msg) # keep copy for later checking
    if 'id' in state_mods:
      this_ip = this_ip + state_mods['id']
      del state_mods['id']
    if not queue_down.empty(): # altered animation_state available
      STATE = queue_down.get()
      for ip in IPLIST:
        IPLIST[ip] = False
    if len(state_mods) > 0: # update state to include this instruction
      queue_up.put(state_mods) # only do this if there's something to send
      for key in state_mods:
        STATE[key] = state_mods[key]
      for ip in IPLIST:
        IPLIST[ip] = False
    if not (this_ip  in IPLIST and IPLIST[this_ip] == True): # needs refresh
      IPLIST[this_ip] = True
      return json.dumps(STATE, separators=(',',':'))
    else: # nothing new
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

  os.nice(-5) # reduce niceness of process after spawning child processes

else: ## not MASTER so SLAVE!
  import urllib2
  t_flag = [0]
  #use this for flagging completion, has to be [] to pass by ref. 3 states:
  #-1 get state from MASTER, 1 fresh info returned, 0 with for next time
  t = Thread(target=slave_checker, args=(animation_state, t_flag))
  t.daemon = True
  t.start()

nextTime = time.time()

last_amp = 0       # music amplitude from FFT to see rel changes
last_frame = 0     # for working out frames per beat
num_amp = 0        # counting beats for working out frames per beat
av_amp = 30        # exponentially smoothed music amplitude
activity = 0       # increased by user input, decays each loop
last_ftype = 'box' # used by slave to check need to change fg shape
freeze_time = 10.0 # seconds after a user mod before auto restarts


while DISPLAY.loop_running():
  refresh = False #only send new state info to server subprocess if changed
  animation_state.updateTimeAndFrameCount()
  if MASTER:
    ####### music checking #######
    for i in range(13):
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
            ftype = animation_state.state['f_type']
            if ftype != int(foreground.geometry.name):
              if ftype == 2:
                foreground = points
              elif ftype == 1:
                foreground = sphere
              else:
                foreground = box

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
          if mkey == 'f_type' and msg[mkey] != int(foreground.geometry.name):
            if msg[mkey] == 2:
              foreground = points
            elif msg[mkey] == 1:
              foreground = sphere
            else:
              foreground = box
      nextTime = time.time() + freeze_time
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
    if t_flag[0] == 1: #fresh info in animation_state by thread 
      this_ftype = animation_state.state['f_type']
      if this_ftype != int(foreground.geometry.name):
        if this_ftype == 2:
          foreground = points
        elif this_ftype == 1:
          foreground = sphere
        else:
          foreground = box
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

