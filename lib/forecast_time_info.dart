import 'package:flutter/material.dart';

Widget forecastTimeInfoRow() {
  return Row(
    children: <Widget> [
      Expanded(
          child: _forecastTimeInfo()
      ),
      Expanded(
          child: _forecastTimeInfo()
      )
    ],
  );
}

Widget _forecastTimeInfo () {
  return Container(
    width:100,
    height: 100,
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget> [
        Image.asset(
          'images/icon_weather/cloud_clouds_cloudy_icon.png',
          width:50.0,
        ),
        Text("온도"),
        Text("체감"),
      ],
    ),
  );
}