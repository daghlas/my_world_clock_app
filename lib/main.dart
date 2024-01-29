import 'package:flutter/material.dart';
import 'package:my_world_clock_app/pages/home.dart';
import 'package:my_world_clock_app/pages/loading.dart';
import 'package:my_world_clock_app/pages/location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => const Home(),
    '/location': (context) => const Location(),
  },
));
