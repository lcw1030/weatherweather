
import 'package:flutter/material.dart';
import 'package:weatherweather/weather_api_class.dart';
/*
Widget forecastTimeInfoRow(DisplayWeather display) {
  return Row(
    children: <Widget> [
      Expanded(
          child: forecastTimeInfo(display)
      ),
      Expanded(
          child: forecastTimeInfo(display)
      )
    ],
  );
}*/

Widget forecastTimeInfo (String imagePath, DisplayWeather display) {
  return Container(
    width: 150,
    height: 120,
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget> [
        Image.asset(
          imagePath,
          width:50.0,
        ),
        Text(display.weatherData),
        Text(display.description1),
        Text(display.description2??''),
      ],
    ),
  );
}