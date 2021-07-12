import 'package:flutter/material.dart';
import 'package:weatherweather/screen.dart';
import 'package:weatherweather/weather_api.dart';
import 'package:weatherweather/weather_api_class.dart';
class Uv extends StatefulWidget {
  @override
  _UvState createState() => _UvState();
}

class _UvState extends State<Uv> {
  String type = 'uv';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder(
          future: getCurrentData(),
          builder: (context, AsyncSnapshot<Weather> snapshot) {
            if (snapshot.hasData == false) {
              print('snapshot');
              return CircularProgressIndicator();
            }
            Weather weatherData = snapshot.data!;
            var displayInfo = ExtractWeather(type, weatherData);
            return Screen(
              type: type,
              main: displayInfo[type]![0],
              icon: displayInfo[type]![1],
              value: displayInfo[type]![2],
              description1: '${displayInfo[type]![0]}: ${displayInfo[type]![3]}',
              description2: '',
            );
          },
        ),

      ],
    );
  }
}