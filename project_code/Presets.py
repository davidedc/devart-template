#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
{'b_scale':0, 'b_spin':0, 'b_speed':0, 'b_shader':0, 'b_mult':0, 'b_param1':0,
  'b_param2':0, 'b_paltt':0, 'b_inv':0, 'b_fx1':0, 'b_fx2':0, 'b_fx3':0, 'b_fx4':0,
  'f_scale':0, 'f_spin':0, 'f_speed':0, 'f_shader':0, 'f_mult':0, 'f_param1':0,
  'f_param2':0, 'f_paltt':0, 'f_inv':0, 'f_fx1':0, 'f_fx2':0, 'f_fx3':0, 'f_fx4':0,
  'geom_jump':0, 'colr_jump':0, 'user1':[0.3, 0.3, 0.3], 'user2':[0.6, 0.6, 0.6]}"""
############### geometery 
# 1=>preset[0] 2=>preset[1] etc
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
############### palette 
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
