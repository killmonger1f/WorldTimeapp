import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading";
  void Setupworldtime() async {
    Worldtime instance =
        Worldtime(location: 'Kolkata', url: 'Asia/Kolkata', flag: 'india.png');
    await instance.gettime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isday': instance.isday,
    });
  }

  @override
  void initState() {
    super.initState();
    Setupworldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
