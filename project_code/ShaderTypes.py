#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pi3d

class ShaderTypes(object):
  
  # the palette names are just indexes into a table
  dots = 0
  rings = 1
  stripes = 2
  gradient = 3

  shadersTable = []
  petalTable = []
  powerTable = []

  def __init__(self):
    ShaderTypes.shadersTable = [
      pi3d.Shader('shaders/mat_dots_color'),
      pi3d.Shader('shaders/mat_rings_color'),
      pi3d.Shader('shaders/mat_grad_color'),
      pi3d.Shader('shaders/mat_stripe_color'),
      pi3d.Shader('shaders/mat_noise_color')
   ]
    
    ShaderTypes.petalTable = [0.01, 0.03, 0.05, 0.06, 0.08, 0.1, 0.12,
                              0.14, 0.15, 0.16, 0.18, 0.2, 0.21, 0.23,
                              0.25, 0.28, 0.3, 0.31, 0.33, 0.35]
    ShaderTypes.powerTable = [-2.0, -1.8, -1.5, -1.4, -1.3, -1.2,-0.1,
                              -0.001, -0.0001, 0.00001, 0.01, 0.02, 0.07,
                              0.1, 0.6, 1.0, 1.2, 1.4, 2.0, 3.0]
