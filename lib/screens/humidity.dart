import 'package:flutter/material.dart';
import 'package:weatherweather/screen.dart';
import 'package:weatherweather/weather_api.dart';
import 'package:weatherweather/weather_api_class.dart';
class Humidity extends StatefulWidget {
  @override
  _HumidityState createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
  String type = 'humidity';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
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
      ),
    );
  }
}