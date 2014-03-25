#!/usr/bin/env python
# -*- coding: utf-8 -*-

import random, time

from Presets import preset, fields, themes, samples

class AnimationState(object):
  def __init__(self):
    self.millis = int(round(time.time() * 1000))
    self.frameCount = 0
    self.millisDelta = 0
    self.state = {'b_scale':0, 'b_spin':0, 'b_speed':0, 'b_shader':0, 'b_mult':0,
            'b_param1':0, 'b_param2':0, 'b_paltt':0, 'b_inv':0, 'b_fx1':0,
            'b_fx2':0, 'b_fx3':0, 'b_fx4':0, 'b_rot':[0.0, 0.0, 0.0],
            'f_scale':0, 'f_spin':0, 'f_speed':0, 'f_shader':0, 'f_mult':0,
            'f_param1':0, 'f_param2':0, 'f_paltt':0, 'f_inv':0, 'f_fx1':0,
            'f_fx2':0, 'f_fx3':0, 'f_fx4':0, 'f_rot':[0.0, 0.0, 0.0],
            'user1':[0.3, 0.3, 0.3], 'user2':[0.6, 0.6, 0.6],
            'light':0, 'beatf':8, 'f_type':0}
    self.last_activity = 'l01'
    self.activity = 'l01'
    self.sample_start = random.randint(0, 75)
    self.base_state = {}
    self.set_base_state()
    self.jumpToPreset(num=0)
    self.sample_pattern = PatternGenerator()
    self.beat_pattern = PatternGenerator()
    
  def set_base_state(self):
    sl = themes[self.activity]
    self.base_state = {}
    while len(self.base_state) < 12:
      key = random.choice(['b_', 'f_']) + random.choice(sl.keys())
      if key == 'b_paltt':
        key = 'f_paltt'
      if key == 'b_type':
        key = 'f_type'
      if not(key in self.base_state):
        self.base_state[key] = random.randint(0, 75)

  def beat_progress(self):
    sl = themes[self.activity]
    delta = self.beat_pattern.next_val()
    for key in self.base_state:
      slkey = key[2:]
      self.state[key] = sl[slkey][(self.base_state[key] + delta) % len(sl[slkey])]
      if key == 'b_shader' and self.state[key] % 5 == 4:
        self.state[key] += 1

  def sample_progress(self):
    if self.last_activity != self.activity:
      self.sample_pattern.regenerate()
      self.sample_start = random.randint(0, 75)
    self.set_base_state()
    self.beat_pattern.regenerate()
    self.last_activity = self.activity
    sl = samples[self.activity]
    return sl[(self.sample_start + self.sample_pattern.next_val()) % len(sl)]
    
  def updateTimeAndFrameCount(self):
    curTime = int(round(time.time() * 1000))
    self.millisDelta = int(curTime - self.millis)
    self.millis = curTime
    self.frameCount += 1

  def jumpToPreset(self, num=0):
    num = num % len(preset)
    for i in preset[num]:
      self.state[i] = preset[num][i]
    
  def setPreset(self, num=0):
    num = num % len(preset)
    for i in preset[num]:
      preset[num][i] = self.state[i]
  

class PatternGenerator(object):
  def __init__(self):
    import time
    self.seedVal = random.randint(1000000, 9999999)
    self.regenerate()
    self.N = 16 * 8

  def regenerate(self):
    self.seedVal += 1
    self.a = [0 for i in range(16)]
    self.b = [0 for i in range(16)]
    self.c = [0 for i in range(8)]
    for i in range(16):
      seedBit = self.seedVal >> i
      if (seedBit & 1) == 0:
        for j in range(i, 16, i+2):
          self.a[j] += 1
      else:
        for j in range(i, 16, i+2):
          self.b[j] += 1
      if (seedBit & 3) == 3:
        for j in range(i, 8, i+2):
          self.c[j] = (self.c[j] + 1) % 2
    self.bProg = 0
    self.pointer = 0

  def next_val(self):
    if self.pointer >= self.N:
      self.pointer = 0
    if self.c[self.pointer % 8] == 1:
      self.bProg = self.b[self.pointer % 16]
    rval = (self.bProg + self.a[self.pointer % 16]) % 15
    self.pointer += 1
    return rval
