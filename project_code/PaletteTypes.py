#!/usr/bin/env python
# -*- coding: utf-8 -*-

from Colors import Colors

class PaletteTypes(object):
  
  paletteTable = [
    # note that the order doesn't matter. The option to reverse colors
    # means that only one combination of each needs to be listed
    [Colors.user1, Colors.user2],
    [Colors.pink, Colors.transparent],
    [Colors.pink, Colors.yellow],
    [Colors.pink, Colors.green],
    [Colors.pink, Colors.orange],
    [Colors.pink, Colors.violet],
    [Colors.pink, Colors.rubyRed],
    [Colors.pink, Colors.deepTurquoise],
    [Colors.pink, Colors.white],
    [Colors.pink, Colors.black],

    [Colors.pink, Colors.user1],
    [Colors.pink, Colors.user2],
    [Colors.yellow, Colors.transparent],
    [Colors.yellow, Colors.green],
    [Colors.yellow, Colors.orange],
    [Colors.yellow, Colors.violet],
    [Colors.yellow, Colors.rubyRed],
    [Colors.yellow, Colors.deepTurquoise],
    [Colors.yellow, Colors.white],
    [Colors.yellow, Colors.black],

    [Colors.yellow, Colors.user1],
    [Colors.yellow, Colors.user2],
    [Colors.green, Colors.transparent],
    [Colors.green, Colors.orange],
    [Colors.green, Colors.violet],
    [Colors.green, Colors.rubyRed],
    [Colors.green, Colors.deepTurquoise],
    [Colors.green, Colors.white],
    [Colors.green, Colors.black],
    [Colors.green, Colors.user1],

    [Colors.green, Colors.user2],
    [Colors.orange, Colors.transparent],
    [Colors.orange, Colors.violet],
    [Colors.orange, Colors.rubyRed],
    [Colors.orange, Colors.deepTurquoise],
    [Colors.orange, Colors.white],
    [Colors.orange, Colors.black],
    [Colors.orange, Colors.user1],
    [Colors.orange, Colors.user2],
    [Colors.violet, Colors.transparent],

    [Colors.violet, Colors.rubyRed],
    [Colors.violet, Colors.deepTurquoise],
    [Colors.violet, Colors.white],
    [Colors.violet, Colors.black],
    [Colors.violet, Colors.user1],
    [Colors.violet, Colors.user2],
    [Colors.rubyRed, Colors.transparent],
    [Colors.rubyRed, Colors.deepTurquoise],
    [Colors.rubyRed, Colors.white],
    [Colors.rubyRed, Colors.black],

    [Colors.rubyRed, Colors.user1],
    [Colors.rubyRed, Colors.user2],
    [Colors.deepTurquoise, Colors.transparent],
    [Colors.deepTurquoise, Colors.white],
    [Colors.deepTurquoise, Colors.black],
    [Colors.deepTurquoise, Colors.user1],
    [Colors.deepTurquoise, Colors.user2],
    [Colors.white, Colors.transparent],
    [Colors.white, Colors.black],
    [Colors.white, Colors.user1],

    [Colors.white, Colors.user2],
    [Colors.black, Colors.transparent],
    [Colors.black, Colors.user1],
    [Colors.black, Colors.user2],
    [Colors.transparent, Colors.user1],
  ]
  
