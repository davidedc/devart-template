#!/usr/bin/python
from __future__ import absolute_import, division, print_function, unicode_literals
""" A very simple gradient-colored cube and a simple solid colored box """
import demo
import pi3d
import threading
import time

from Background import Background
from Colors import Colors
from Presets import geom_preset, color_preset
from AnimationState import AnimationState
from SimpleCube import SimpleCube
from ShaderTypes import ShaderTypes

counter = [None]*5
counter[0] = 0

DISPLAY = pi3d.Display.create(frames_per_second=30)

ShaderTypes()

mykeys = pi3d.Keyboard()

perspectiveCamera = pi3d.Camera(is_3d=True)
ortographicCamera = pi3d.Camera(is_3d=False)

box = SimpleCube(perspectiveCamera)
background = Background(perspectiveCamera)

animation_state = AnimationState()

writeState = 0 # waiting / sliding in / blink-in / showing / blinkout / sliding out
startSlideInMs = 0
startBlinkInMS = 0
startShowInMS = 0
startBlinkOutMS = 0
startSlideOutMS = 0

#### server process and queue
from multiprocessing import Process, Queue
from flask import Flask, render_template, request
import json

app = Flask(__name__)
queue_down = Queue()
queue_up = Queue()
STATE = {}

@app.route("/")
def hello():
  templateData = {'fields':[
        ['bkga', [['f_scale',20], ['f_spin',6], ['f_speed',20], ['f_shader',5], ['f_mult',20], ['f_param1',20], ['f_param2',20]]],
        ['bkgb', [['f_paltt',20], ['f_inv',2], ['f_fx1',2], ['f_fx2',2], ['f_fx3',2], ['f_fx4',2]]],
        ['bkga', [['b_scale',20], ['b_spin',6], ['b_speed',20], ['b_shader',5], ['b_mult',20], ['b_param1',20], ['b_param2',20]]],
        ['bkgb', [['b_inv',2], ['b_fx1',2], ['b_fx2',2], ['b_fx3',2], ['b_fx4',2]]],
        ['bkga', [['geom_jump',10]]],
        ['bkgb', [['colr_jump',10]]],
        ['bkg1', [['user1h',20],['user1s',20],['user1v',20]]],
        ['bkg2', [['user2h',20],['user2s',20],['user2v',20]]]
        ]} 
  return render_template('main.html', **templateData)

@app.route("/update/")
def update():
  global STATE
  msg = request.args['msg']
  queue_up.put(json.loads(msg))
  if not queue_down.empty():
    STATE = queue_down.get()
  return json.dumps(STATE, separators=(',',':'))

def start_server():
  app.run(host='0.0.0.0', port=80, debug=True, use_reloader=False)

p = Process(target=start_server)
p.daemon = True
p.start()

nextTime = time.time()
chosen_geom = 0
chosen_color = 0

while DISPLAY.loop_running():

  animation_state.updateTimeAndFrameCount()
  if (animation_state.frameCount % 10) == 0:
    #first check if anything has been sent from tablets and eat to last one
    msg = None
    while not queue_up.empty():
      msg = queue_up.get()
    if msg:
      for mkey in msg:
        if mkey == 'geom_jump':
          animation_state.jumpToGeometry(msg[mkey])
          chosen_geom = msg[mkey]
        elif mkey == 'colr_jump':
          animation_state.jumpToColor(msg[mkey])
          chosen_color = msg[mkey]
        elif mkey == 'user1':
          animation_state.jumpToColor(0)
          chosen_color = 0
          animation_state.state['user1'] = [i / 255.0 for i in msg[mkey]]
        elif mkey == 'user2':
          animation_state.jumpToColor(0)
          chosen_color = 0
          animation_state.state['user2'] = [i / 255.0 for i in msg[mkey]]
        else:
          if mkey in geom_preset[chosen_geom]:
            geom_preset[chosen_geom][mkey] = msg[mkey]
            animation_state.jumpToGeometry(chosen_geom)
          if mkey in color_preset[chosen_color]:
            color_preset[chosen_color][mkey] = msg[mkey]
            animation_state.jumpToColor(chosen_color)
      nextTime = time.time() + 5.0
    #clear it if nothing has consumed previous input to queue
    while not queue_down.empty():
      queue_down.get()
    queue_down.put(animation_state.state)
    if time.time() > nextTime:
      animation_state.randomiseOne()
  box.draw(animation_state)
  background.draw(animation_state)

  theKey = mykeys.read()
  if theKey == 27: # esc
    mykeys.close()
    DISPLAY.destroy()
    p.terminate()
    break
    
  elif theKey >= 48 and theKey <= 57:
    theKey -= 48
    if theKey < 5:
      animation_state.jumpToGeometry(theKey)
      chosen_geom = theKey
    else:
      animation_state.jumpToColor(theKey)
      chosen_color = theKey

