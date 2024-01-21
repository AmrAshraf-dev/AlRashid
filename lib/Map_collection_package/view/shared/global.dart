import 'package:flutter/material.dart';

abstract class Global {
  static const Color blue = Color(0xff4A64FE);
  static const Color primaryColor = Color(0xffb83f48);

  static const List lights = [
    {
      'location': 'Clothes',
      'name': 'De Facto',
      'status': false,
      'position': [0.0, 0.0],
      'tile': 1,
    },
    {
      'location': 'Office 01',
      'name': 'LC Waikiki',
      'status': true,
      'position': [-0.07, 0.0],
      'tile': 2,
    },
    {
      'location': 'Meeting room 01',
      'name': 'NIKE',
      'status': false,
      'position': [0.08, 0.0],
      'tile': 2,
    },
    {
      'location': 'Office 02',
      'name': 'ADIDAS',
      'status': true,
      'position': [0.0, 0.0],
      'tile': 3,
    },
    {
      'location': 'Box Office',
      'name': 'SOON',
      'status': true,
      'position': [-0.07, -0.02],
      'tile': 4,
    },
    {
      'location': 'Entrance',
      'name': 'SOON',
      'status': false,
      'position': [0.05, 0.0],
      'tile': 4,
    },
    {
      'location': 'Entrance',
      'name': 'Miniso',
      'status': true,
      'position': [-0.05, 0.1],
      'tile': 4,
    },
  ];
}
