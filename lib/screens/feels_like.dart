import 'package:flutter/material.dart';
import 'package:weatherweather/screen.dart';
import 'package:weatherweather/weather_api.dart';
import 'package:weatherweather/weather_api_class.dart';
class FeelsLike extends StatefulWidget {
  @override
  _FeelsLikeState createState() => _FeelsLikeState();
}

class _FeelsLikeState extends State<FeelsLike> {
  String type = 'feelslike';
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
              description1: '최고 ${snapshot.data!.tempMax}°/최저 ${snapshot.data!.tempMin}°',
              description2: '',
            );
          },
        ),

      ],
    );
  }
}