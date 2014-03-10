#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pi3d
import sys

from Geometry import Geometry
import random

class SimpleCube(Geometry):
  def __init__(self, camera):
    super(SimpleCube, self).__init__(camera, pi3d.Cuboid(w=40, h=40, d=40, x=0, y=0, z=160.0))


class SimpleSphere(Geometry):
  def __init__(self, camera):
    super(SimpleSphere, self).__init__(camera, pi3d.Sphere(radius=20.0, slices=16, sides=16, x=0, y=0, z=160.0))


class SimplePoints(Geometry):
  def __init__(self, camera):
    vertices = [((i % 60.0) / 3.0 - 10.0, int(i / 60.0) / 3.0 - 10.0, random.gauss(0.0, 10.0)) for i in range(4320)]
    normals = None
    n_v = len(vertices)
    indices = [(a, a + 1, a + 2) for a in range(0, n_v, 3)]
    tex_coords = [(v[0] / 20.0 + 0.5, v[1] / 20.0 + 0.5) for v in vertices]
    points = pi3d.Shape(camera=camera, light=None, name='points', x=0, y=0, z=160.0,
               rx=0, ry=0, rz=0, sx=0, sy=0, sz=0, cx=0, cy=0, cz=0)
    points.buf = [pi3d.Buffer(points, vertices, tex_coords, indices, normals, smooth=False)]
    super(SimplePoints, self).__init__(camera, points)
    self.geometry.set_point_size(50)
