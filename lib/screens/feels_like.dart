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
                  description1: '',
                  description2: '최고 ${weatherData.tempMax}°/최저 ${weatherData.tempMin}°',
                  data: snapshot.data,
                );
              }
          ),

        ],
      ),
    );
  }
}
//'최고 ${snapshot.data!.tempMax}°/최저 ${snapshot.data!.tempMin}°',