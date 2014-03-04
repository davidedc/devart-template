#!/usr/bin/python
from __future__ import absolute_import, division, print_function, unicode_literals
from PIL import Image, ImageDraw
from PaletteTypes import PaletteTypes
from Colors import Colors as co

import math

side = 72
margin = 10
outside = (side + 2 * margin)
w = h = int(10 * outside)

bkg = (200, 200, 200)
im = Image.new('RGB', (w, h), bkg)
draw = ImageDraw.Draw(im)

for i, pt in enumerate(PaletteTypes.paletteTable):
  x1 = (i * outside) % w + margin
  x2 = x1 + side
  y1 = int(math.floor(i / 10) * outside + margin)
  y2 = y1 + side
  c1 = tuple(int(225 * i) for i in pt[0]) if pt[0][0] >= 0 else bkg
  c2 = tuple(int(225 * i) for i in pt[1]) if pt[1][0] >= 0 else bkg
  
  draw.ellipse([x1, y1, x2, y2], fill=c1)
  draw.ellipse([x1 + 16, y1 + 16, x2 - 16, y2 - 16], fill=c2)
  
del draw
im = im.resize((int(w/2), int(h/2)), resample=Image.ANTIALIAS)
im.save("swatches.png")
