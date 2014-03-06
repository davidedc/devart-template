#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pi3d
import sys

from Geometry import Geometry
from PaletteTypes import PaletteTypes
from ShaderTypes import ShaderTypes
from random import uniform

class SimpleSphere(Geometry):

  def __init__(self, camera):
    super(SimpleSphere, self).__init__(camera, pi3d.Sphere(radius=20.0, slices=16, sides=16, x=0, y=0, z=160.0))
