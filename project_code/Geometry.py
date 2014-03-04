#!/usr/bin/env python
# -*- coding: utf-8 -*-

import math

from PaletteTypes import PaletteTypes
from ShaderTypes import ShaderTypes
from random import uniform

class Geometry(object):
  """ Background and SimpleCube inherit from this
  """
  geometry = None
  cameraToUse = None
  shaderFlat = None
  tex = None

  def __init__(self, camera, geometry, fground=True):
    self.cameraToUse = camera
    self.geometry = geometry
    self.geometry.set_material((1.0, 0.0, 0.0))
    self.fground = fground
    
  def draw(self, ani_state):
    geometry = self.geometry # little shortcut
    fground = self.fground
    beatf = ani_state.state['beatf']
    light_level = ani_state.state['light']
    if fground:
      state_part = 'f_'
    else:
      state_part = 'b_'
    sp = ((ani_state.state[state_part + 'speed'] % 20) / 5.0) - 2.0
    speedMillisDivider = math.copysign(10**(2.0 - abs(sp)), sp)
    animationSpeed = ani_state.millisDelta / speedMillisDivider
    if not fground:
      # the background should move slower to give a parallax effect
      animationSpeed /= 5.0

    animationType = (int(
        ani_state.state[state_part + 'spin']
        )) % 6 # spinZ, spinX, spinY, spinZSpinX, spinXSpinYSpinZ, noise
    if animationType == 0:
      geometry.rotateIncZ(animationSpeed)
    elif animationType == 1:
      geometry.rotateIncX(animationSpeed)
    elif animationType == 2:
      geometry.rotateIncY(animationSpeed)
    elif animationType == 3:
      geometry.rotateIncZ(animationSpeed)
      #if fground:
      geometry.rotateIncX(animationSpeed)
    elif animationType == 4:
      #if fground:
      geometry.rotateIncX(animationSpeed)
      geometry.rotateIncY(animationSpeed)
      geometry.rotateIncZ(animationSpeed)
    elif animationType == 5:
      #if fground:
      geometry.rotateIncX(animationSpeed * uniform(-1, 1))
      geometry.rotateIncY(animationSpeed * uniform(-1, 1))
      geometry.rotateIncZ(animationSpeed * uniform(-1, 1))

    scale = ani_state.state[state_part + 'scale']
    if fground:
      scale = 1.0 + (scale % 20) / 4.0 # from 0,10 to 1,5
    else:
      scale = 15.0 + (scale % 20) / 4.0
    geometry.scale(scale, scale, scale)

    shaderType = (int(
        ani_state.state[state_part + 'shader']
        )) % len(ShaderTypes.shadersTable)
    shader = ShaderTypes.shadersTable[shaderType]
    geometry.set_shader(shader)


    # use the palette scale to invert the colors
    paletteInvert = (int(
        ani_state.state[state_part + 'inv']
        )) % 2
        
    if ani_state.state['f_paltt'] == 0:
      col1 = [i for i in ani_state.state['user1']]
      col2 = [i for i in ani_state.state['user2']]
    else:
      paletteEntry =   PaletteTypes.paletteTable[
        (int(
          ani_state.state['f_paltt']
          )) % len(PaletteTypes.paletteTable)]
      col1 = [i for i in paletteEntry[0]]
      col2 = [i for i in paletteEntry[1]]
    
    ######## light levels ###############
    col1 = [i * light_level for i in col1]
    col2 = [i * light_level for i in col2]
    
    if paletteInvert:
      col1,col2 = col2,col1

    # goes from 0 to 5, only the first four do something
    # swap, shades, random, flash
    # TODO music related function rather than frameCount % 8
    swap = ani_state.state[state_part + 'fx1'] % 2
    shde = ani_state.state[state_part + 'fx2'] % 2
    rndm = ani_state.state[state_part + 'fx3'] % 2
    flsh = ani_state.state[state_part + 'fx4'] % 2
    fc = ani_state.frameCount % beatf
    if swap and fc == 0:
      col1,col2 = col2,col1
    if shde and fc == 2:
      if uniform(0, 1) > 0.5:
        col1 = [0.5 + 0.5 * i for i in col1]
        col2 = [light_level - i for i in col2]
      else:
        col1 = [light_level - i for i in col1]
        col2 = [light_level - i for i in col2]
    if rndm and fc == 4:
      col1 = [uniform(0, light_level) for i in col1]
      col2 = [uniform(0, light_level) for i in col2]
    if flsh and fc == 6:
      col1 =  [0.8 * light_level + 0.2 * i for i in col1]
      col2 =  [0.8 * light_level + 0.2 * i for i in col2]

    geometry.set_custom_data(48, col1)
    geometry.set_custom_data(51, col2)

    shaderScale = 1.0 + int(ani_state.state[state_part + 'mult']) % 20.0
    # with the dots shader, too few dots don't look super-cool, so adjust
    if shaderType == ShaderTypes.dots:
      shaderScale = 5.0 + shaderScale
      
    i = int(ani_state.state[state_part + 'param1'])
    param1 = ShaderTypes.petalTable[i % len(ShaderTypes.petalTable)]

    i = int(ani_state.state[state_part + 'param2'])
    param2 = ShaderTypes.powerTable[i % len(ShaderTypes.powerTable)]

    geometry.set_custom_data(54, [shaderScale, param1, param2]) # number of stripes etc

    geometry.draw(camera=self.cameraToUse)

  def pos(self):
    """returns angular displacements for synchronising with other pis"""
    return self.geometry.unif[3:6]
