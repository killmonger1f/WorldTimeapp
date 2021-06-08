//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:worldtimeapp/loading.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtimeapp/spinner.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<Worldtime> locations = [
    Worldtime(
        location: 'Kolkata',
        url: 'Asia/Kolkata',
        flag: 'india.png',
        country: 'India'),
    Worldtime(
        location: 'Dubai',
        url: 'Asia/Dubai',
        flag: 'uae.jpg',
        country: 'United Arab Emirates'),
    Worldtime(
        location: 'London',
        url: 'Europe/London',
        flag: 'london.png',
        country: 'United Kingdom'),
    Worldtime(
        location: 'Tokyo',
        url: 'Asia/Tokyo',
        flag: 'japan.png',
        country: 'Japan'),
    Worldtime(
        location: 'New York',
        url: 'America/New_York',
        flag: 'usa.png',
        country: 'USA'),
  ];

  void Updatetime(index) async {
    Worldtime instance = locations[index];
    await instance.gettime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isday': instance.isday,
    });
  }

  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return spinner
        ? Spinner()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange[300],
              title: Text(
                'LOCATION',
                style: TextStyle(
                  letterSpacing: 5.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                  child: Card(
                      child: ListTile(
                    onTap: () {
                      setState(() {
                        spinner = true;
                      });
                      Updatetime(index);
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage:
                          AssetImage("lib/assets/${locations[index].flag}"),
                      radius: 20.0,
                    ),
                    title: Text(
                      locations[index].country,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 0.0),
                    ),
                    subtitle: Text(
                      locations[index].location,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          letterSpacing: 2.0),
                    ),
                    tileColor: Colors.black,
                  )),
                );
              },
            ),
            backgroundColor: Colors.grey[200],
          );
  }
}
