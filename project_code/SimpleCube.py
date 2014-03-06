#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pi3d
import sys

from Geometry import Geometry
from PaletteTypes import PaletteTypes
from ShaderTypes import ShaderTypes
from random import uniform

class SimpleCube(Geometry):

  def __init__(self, camera):
    super(SimpleCube, self).__init__(camera, pi3d.Cuboid(w=40, h=40, d=40, x=0, y=0, z=160.0))
