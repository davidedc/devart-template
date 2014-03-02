#!/usr/bin/env python
# -*- coding: utf-8 -*-

import random, time

from Presets import geom_preset, color_preset, fields

class AnimationState(object):
  
  millis = int(round(time.time() * 1000))
  frameCount = 0
  millisDelta = 0
  
  state = {'b_scale':0, 'b_spin':0, 'b_speed':0, 'b_shader':0, 'b_mult':0,
          'b_petals':0, 'b_param2':0, 'b_paltt':0, 'b_inv':0, 'b_fx1':0,
          'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
          'f_scale':0, 'f_spin':0, 'f_speed':0, 'f_shader':0, 'f_mult':0,
          'f_petals':0, 'f_param2':0, 'f_paltt':0, 'f_inv':0, 'f_fx1':0,
          'f_fx2':0, 'f_fx3':0, 'f_fx4':03, 'user1':[0.3, 0.3, 0.3],
          'user2':[0.6, 0.6, 0.6], 'light':0, 'beatf':8}

  def randomiseOne(self):
    key = random.choice(list(self.state.keys()))
    if not 'user' in key:
      for f in fields:
        for g in f[1]:
          if key == g[0]:
            self.state[key] = random.randint(0, g[1])
            return
  
  # TODO music related function for animation effects
  def updateTimeAndFrameCount(self):
    curTime = int(round(time.time() * 1000))
    self.millisDelta = int(curTime - self.millis)
    self.millis = curTime
    self.frameCount += 1

  def jumpToGeometry(self, num=0):
    num = num % len(geom_preset)
    for i in geom_preset[num]:
      self.state[i] = geom_preset[num][i]
    
  def jumpToColor(self, num=0):
    num = num % len(color_preset)
    for i in color_preset[num]:
      self.state[i] = color_preset[num][i]
  
  # you can also make a method to undo / redo
  # you can make a method to mark one or two states and periodically
  # go back to those
 
  def __init__(self):
    self.jumpToGeometry(num=0)
    self.jumpToColor(num=0)

