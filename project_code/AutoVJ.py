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
  templateData = {} # could current state I suppose
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
          geom_preset_id = msg[mkey]
        elif mkey == 'colr_jump':
          animation_state.jumpToColor(msg[mkey])
          color_preset_id = msg[mkey]
        elif mkey == 'user1':
          animation_state.jumpToColor(0)
          color_preset_id = 0
          Colors.user1 = [i for i in msg[mkey]]
        elif mkey == 'user2':
          animation_state.jumpToColor(0)
          color_preset_id = 0
          Colors.user2 = [i for i in msg[mkey]]
        else:
          if mkey in geom_preset[chosen_geom]:
            geom_preset[chosen_geom][mkey] = msg[mkey]
            animation_state.jumpToGeometry(chosen_geom)
          if mkey in color_preset[chosen_color]:
            geom_preset[chosen_color][mkey] = msg[mkey]
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
  
  elif theKey == 32: # space
    #pi3d.screenshot("screenshots/" + str(animation_state.frameCount)+".png")
    #try to debug occasional cube disappearance
    s = animation_state.state[1]
    print("scale={:4.2f} spin_type={:4.2f} speed={:4.2f}".format(s[0][1] % 5, s[0][2] % 6, s[0][3] % 7))
    print("shader={:4.2f} dotscale={:4.2f} petal={:4.2f} power={:4.2f} cols={:4.2f}".format(s[1][0] % 5, s[1][1], s[1][4] % 8, s[1][5] % 11, s[2][0]))
  
  elif theKey >= 48 and theKey <= 57:
    theKey -= 48
    if theKey < 5:
      animation_state.jumpToGeometry(theKey)
    else:
      animation_state.jumpToColor(theKey)

