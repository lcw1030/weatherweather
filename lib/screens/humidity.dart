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
        children: <Widget> [
          FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.hasData == false) {
                  return CircularProgressIndicator();
                }
                //print(snapshot.data!);
                Weather weatherData = extractCurrentWeather(snapshot.data!);
                var displayInfo = formatWeather(type, weatherData);
                return Screen(
                  type: type,
                  main: displayInfo[type]![0],
                  value:displayInfo[type]![2],
                  icon: displayInfo[type]![1],
                  description1: '${displayInfo[type]![0]}: ${displayInfo[type]![3]}',
                  description2: '',
                  data: snapshot.data,
                );
              }
          ),

        ],
      ),
    );
  }
}