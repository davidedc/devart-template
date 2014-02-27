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
from GeometryTypeSimpleCube import GeometryTypeSimpleCube
from Midground import Midground
from ShaderTypes import ShaderTypes

counter = [None]*5
counter[0] = 0

DISPLAY = pi3d.Display.create(frames_per_second=30)

ShaderTypes()

mykeys = pi3d.Keyboard()

perspectiveCamera = pi3d.Camera(is_3d=True)
ortographicCamera = pi3d.Camera(is_3d=False)

box = GeometryTypeSimpleCube(perspectiveCamera)
background = Background(perspectiveCamera)

animation_state = AnimationState()
#midground = Midground()

writeState = 0 # waiting / sliding in / blink-in / showing / blinkout / sliding out
startSlideInMs = 0
startBlinkInMS = 0
startShowInMS = 0
startBlinkOutMS = 0
startSlideOutMS = 0

#### server process and queue
from multiprocessing import Process, Queue
from flask import Flask, render_template
import json

app = Flask(__name__)
queue_down = Queue()
queue_up = Queue()
STATE = {}

@app.route("/")
def hello():
  templateData = {} # could current state I suppose
  return render_template('main.html', **templateData)

@app.route("/update/<int:index1>/<int:index2>/<int:index3>/<value>")
def check(index1, index2, index3, value):
  global STATE
  queue_up.put([index1, index2, index3, value])
  if not queue_down.empty():
    STATE = queue_down.get()
  return json.dumps(STATE, separators=(',',':'))

def start_server():
  app.run(host='0.0.0.0', port=80, debug=True, use_reloader=False)

p = Process(target=start_server)
p.daemon = True
p.start()

nextTime = time.time()
geom_preset_id = 0
color_preset_id = 0

while DISPLAY.loop_running():

  animation_state.updateTimeAndFrameCount()
  if (animation_state.frameCount % 10) == 0:
    #first check if anything has been sent from tablets and eat to last one
    msg = None
    while not queue_up.empty():
      msg = queue_up.get()
    if msg:
      """msg[0]==0 background state
         msg[0]==1 box state
         msg[0]==2 msg[1]==0 msg[2]==0  select geometry preset
         msg[0]==2 msg[1]==0 msg[2]==1  select colour preset
         msg[0]==2 msg[1]==1 msg[2]==0  colour1 rgb as u'r,g,b'
         msg[0]==2 msg[1]==1 msg[2]==1  colour2 rgb
      """
      if msg[0] < 2: #change to state
        if msg[1] < 2: #geometry change
          geom_preset[geom_preset_id][msg[0]][msg[1]][msg[2]] = float(msg[3])
          animation_state.jumpToGeometry(geom_preset_id)
        elif msg[1] == 2: #change to colour related
          color_preset[color_preset_id][msg[0]][0][msg[2]] = float(msg[3])
          animation_state.jumpToColor(color_preset_id)
      elif msg[1] == 0 and msg[2] == 0: #geom preset
        animation_state.jumpToGeometry(msg[3])
        geom_preset_id = msg[3]
      elif msg[1] == 0 and msg[2] == 1: #colour preset
        animation_state.jumpToColor(msg[3])
        color_preset_id = msg[3]
      elif msg[1] == 1 and msg[2] == 0: #rgb mod to colour user1
        animation_state.jumpToColor(0)
        color_preset_id = 0
        Colors.user1 = [float(i) for i in msg[3].split(',')]
      elif msg[1] == 1 and msg[2] == 1: #rgb mod to colour user2
        animation_state.jumpToColor(0)
        color_preset_id = 0
        Colors.user2 = [float(i) for i in msg[3].split(',')]
      nextTime = time.time() + 5.0
    #clear it if nothing has consumed previous input to queue
    while not queue_down.empty():
      queue_down.get()
    queue_down.put({'state':animation_state.state,
          'pos':[background.pos(), box.pos()]})
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

