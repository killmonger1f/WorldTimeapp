//import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  //double scaleofflag = 3.0;
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgimage = data['isday'] ? 'daytime.jpg' : 'nighttime.jpg';
    //print(data);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange[300],
        //leading: Icon(Icons.menu),
        title: Text(
          'WORLD TIME',
          style: TextStyle(letterSpacing: 5.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('lib/assets/$bgimage'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/${data['flag']}',
                  scale: 3.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  data['location'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(10, 10, 14, 10)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data['location'] = result['location'];
                      data['time'] = result['time'];
                      data['flag'] = result['flag'];
                      data['isday'] = result['isday'];
                      if (result['flag'] == 'uae.jpg') {
                        data['flag'] = 'uaefull.png';
                      }
                      // if (data['flag'] == 'usa.png') {
                      //   scaleofflag = 5.0;
                      // } else {
                      //   scaleofflag = 3.0;
                      // }
                    });
                  },
                  icon: Icon(Icons.location_on),
                  label: Text('Choose location'),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
