import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

//http://worldtimeapi.org/api/timezone/Asia/Kolkata

class Worldtime {
  String country;
  String location;
  String flag;
  String url;
  String time;
  bool isday = true;
  Worldtime({this.flag, this.location, this.url, this.country});

  Future<void> gettime() async {
    try {
      String url_final = "http://worldtimeapi.org/api/timezone/$url";
      Response response = await get(Uri.parse(url_final));
      Map worldtime = jsonDecode(response.body);
      String now = worldtime['datetime'];
      String offset = worldtime['utc_offset'];
      DateTime dt = DateTime.parse(now);

      if (offset[0] == '+') {
        dt = dt.add(Duration(
            hours: (int.parse(offset.substring(1, 3))),
            minutes: (int.parse(offset.substring(4, 6)))));
      } else {
        dt = dt.subtract(Duration(
            hours: (int.parse(offset.substring(1, 3))),
            minutes: (int.parse(offset.substring(4, 6)))));
      }
      //print(dt);
      isday = dt.hour > 6 && dt.hour < 19 ? true : false;
      //print(isday);
      time = DateFormat.jm().format(dt);
      //print(time);
    } catch (e) {
      print('Caught error:$e');
      time = "Could not get time";
    }
  }
}
