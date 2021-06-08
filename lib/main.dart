//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:worldtimeapp/chooselocation.dart';
import 'home.dart';
import 'loading.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'RobotoMono'),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Location()
    },
  ));
}
