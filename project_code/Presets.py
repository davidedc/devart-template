#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
{'b_scale':0, 'b_spin':0, 'b_speed':0, 'b_shader':0, 'b_mult':0, 'b_param1':0,
  'b_param2':0, 'b_paltt':0, 'b_inv':0, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
  'f_scale':0, 'f_spin':0, 'f_speed':0, 'f_shader':0, 'f_mult':0, 'f_param1':0,
  'f_param2':0, 'f_paltt':0, 'f_inv':0, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':0,
  'geom_jump':0, 'colr_jump':0, 'user1':[0.3, 0.3, 0.3], 'user2':[0.6, 0.6, 0.6]}"""
  
## geometry preset, the geometry part of the animation state will jump to these values
geom_preset = [   {'b_scale':1, 'b_spin':0, 'b_speed':0, 'b_shader':2, 'b_mult':9, 'b_param1':2, 'b_param2':2,
                  'f_scale':0, 'f_spin':4, 'f_speed':5, 'f_shader':2, 'f_mult':63, 'f_param1':0, 'f_param2':3},
                  {'b_scale':1, 'b_spin':0, 'b_speed':6, 'b_shader':1, 'b_mult':6, 'b_param1':2, 'b_param2':2,
                  'f_scale':0, 'f_spin':4, 'f_speed':5, 'f_shader':1, 'f_mult':6, 'f_param1':2, 'f_param2':4},
                  {'b_scale':1, 'b_spin':0, 'b_speed':5, 'b_shader':1, 'b_mult':6, 'b_param1':0, 'b_param2':4,
                  'f_scale':2, 'f_spin':4, 'f_speed':2, 'f_shader':1, 'f_mult':1, 'f_param1':4, 'f_param2':4}, 
                  {'b_scale':1, 'b_spin':0, 'b_speed':0, 'b_shader':0, 'b_mult':9, 'b_param1':1, 'b_param2':2,
                  'f_scale':4, 'f_spin':4, 'f_speed':5, 'f_shader':0, 'f_mult':63, 'f_param1':6, 'f_param2':3},
                  {'b_scale':1, 'b_spin':0, 'b_speed':0, 'b_shader':0, 'b_mult':9, 'b_param1':1, 'b_param2':2,
                  'f_scale':4, 'f_spin':4, 'f_speed':5, 'f_shader':0, 'f_mult':63, 'f_param1':6, 'f_param2':3},
                  {'b_scale':1, 'b_spin':0, 'b_speed':0, 'b_shader':0, 'b_mult':9, 'b_param1':1, 'b_param2':2,
                  'f_scale':4, 'f_spin':4, 'f_speed':5, 'f_shader':0, 'f_mult':63, 'f_param1':6, 'f_param2':3},
                  {'b_scale':1, 'b_spin':0, 'b_speed':0, 'b_shader':0, 'b_mult':9, 'b_param1':1, 'b_param2':2,
                  'f_scale':4, 'f_spin':4, 'f_speed':5, 'f_shader':0, 'f_mult':63, 'f_param1':6, 'f_param2':3},
                  {'b_scale':1, 'b_spin':0, 'b_speed':0, 'b_shader':0, 'b_mult':9, 'b_param1':1, 'b_param2':2,
                  'f_scale':4, 'f_spin':4, 'f_speed':5, 'f_shader':0, 'f_mult':63, 'f_param1':6, 'f_param2':3},
                  {'b_scale':1, 'b_spin':0, 'b_speed':0, 'b_shader':0, 'b_mult':9, 'b_param1':1, 'b_param2':2,
                  'f_scale':4, 'f_spin':4, 'f_speed':5, 'f_shader':0, 'f_mult':63, 'f_param1':6, 'f_param2':3},
                  {'b_scale':1, 'b_spin':0, 'b_speed':6, 'b_shader':4, 'b_mult':6, 'b_param1':0, 'b_param2':4,
                  'f_scale':4, 'f_spin':4, 'f_speed':1, 'f_shader':0, 'f_mult':1, 'f_param1':2, 'f_param2':4}
        ]
## palette preset, the colour part of the animation state will jump to these values
color_preset = [{'b_paltt':0, 'b_inv':1, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
                'f_paltt':0, 'f_inv':2, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':03},
                {'b_paltt':43, 'b_inv':3, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
                'f_paltt':24, 'f_inv':4, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':0},
                {'b_paltt':56, 'b_inv':5, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
                'f_paltt':27, 'f_inv':6, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':0},
                {'b_paltt':57, 'b_inv':7, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
                'f_paltt':36, 'f_inv':8, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':0},
                {'b_paltt':57, 'b_inv':7, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
                'f_paltt':36, 'f_inv':8, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':0},
                {'b_paltt':57, 'b_inv':7, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
                'f_paltt':36, 'f_inv':8, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':0},
                {'b_paltt':57, 'b_inv':7, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
                'f_paltt':36, 'f_inv':8, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':0},
                {'b_paltt':57, 'b_inv':7, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
                'f_paltt':36, 'f_inv':8, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':0},
                {'b_paltt':57, 'b_inv':7, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
                'f_paltt':36, 'f_inv':8, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':0},
                {'b_paltt':57, 'b_inv':7, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
                'f_paltt':42, 'f_inv':10, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':0}
              ]
## these are the fields sent in json form to and from the web server
fields = [
        ['bkga', [['f_scale',20], ['f_spin',6], ['f_speed',20], ['f_shader',5], ['f_mult',20], ['f_param1',20], ['f_param2',20]]],
        ['bkgb', [['f_paltt',20], ['f_inv',2], ['f_fx1',2], ['f_fx2',2], ['f_fx3',2], ['f_fx4',2]]],
        ['bkga', [['b_scale',20], ['b_spin',6], ['b_speed',20], ['b_shader',5], ['b_mult',20], ['b_param1',20], ['b_param2',20]]],
        ['bkgb', [['b_inv',2], ['b_fx1',2], ['b_fx2',2], ['b_fx3',2], ['b_fx4',2]]],
        ['bkga', [['geom_jump',10]]],
        ['bkgb', [['colr_jump',10]]],
        ['bkg1', [['user1h',20],['user1s',20],['user1v',20]]],
        ['bkg2', [['user2h',20],['user2s',20],['user2v',20]]]
      ]
      
## these are themes to restrict the 'patterned' behaviour
themes = {'low':{'scale':[0,1,2,3,4,5,6,7,8],
                'spin':[0,1,2,3],
                'speed':[7,8,9,10,11,12],
                'shader':[1,2,3],
                'mult':[7,8,9,10,11,12],
                'param1':[7,8,9,10,11,12],
                'param2':[7,8,9,10,11,12],
                'paltt':[3,5,7,10,11,18,19,24,26,27,28,41,42,43,53,54,58],
                'inv':[0,1], 'fx1':[0], 'fx2':[0], 'fx3':[0], 'fx4':[0]},
        'medium':{'scale':[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],
                'spin':[0,1,2,3,4],
                'speed':[4,5,6,7,8,9,10,11,12,13,14,15],
                'shader':[0,1,2,3,4],
                'mult':[4,5,6,7,8,9,10,11,12,13,14,15],
                'param1':[4,5,6,7,8,9,10,11,12,13,14,15],
                'param2':[4,5,6,7,8,9,10,11,12,13,14,15],
                'paltt':[0,1,3,5,6,7,8,9,10,11,12,13,15,17,18,19,20,21,22,23,24,26,27,28,29,30,31,33,
                    35,37,38,39,41,42,43,44,45,46,48,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65],
                'inv':[0,1], 'fx1':[0,1], 'fx2':[0,1], 'fx3':[0], 'fx4':[0]},
        
        'high':{'scale':[6,7,8,9,10,11,12,13,14,15,16,17,18,19],
                'spin':[0,1,2,3,4],
                'speed':[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19],
                'shader':[0,1,2,3,4],
                'mult':[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19],
                'param1':[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19],
                'param2':[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19],
                'paltt':[0,1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,
                    34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65],
                'inv':[0,1], 'fx1':[0,1], 'fx2':[0,1], 'fx3':[0,1], 'fx4':[0,1]}}

samples = {'low':['alien_spirits.mp3', 'Exotic Cinema Ambiance.mp3', 'SpaceSplash.mp3',
              'Ambient Moonscape.mp3', 'Hypnotic Ambiance.mp3', 'unknown.mp3',
              'Cool intro.mp3', 'Interlude.mp3'],
          'medium':['alienport2.mp3', 'digital soldier.mp3', 'on the highway.mp3',
              'techno.mp3', 'crazy.mp3', 'dream.mp3', 'ProgressiveMetal.mp3', 'trip hop.mp3',
              'cyber_dream.mp3', 'Jazz Trap House.mp3', 'spiritual.mp3', 'digital.mp3',
              'MiddleEastAction.mp3', 'techno_beat.mp3'],
          'high':['004.mp3', 'AbstractMix.mp3', 'hurryup.mp3', 'JungleAural.mp3',
              '006.mp3', 'CoolFenderTrap.mp3', 'jasmin.mp3', 'MiddleEastRap.mp3', '010.mp3',
              'Expedition.mp3', 'Jazz Rat.mp3', 'ModernEgypt.mp3', 'Abstractica.mp3',
              'Funky Funky.mp3', 'Jazzy Blues.mp3', 'Rock hop.mp3']}

