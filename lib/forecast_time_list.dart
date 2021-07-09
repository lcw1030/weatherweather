import 'package:flutter/material.dart';
import 'package:ntp/ntp.dart';
import 'package:weatherweather/forecast_time_info.dart';

import 'package:weatherweather/current_weather_api.dart';

class ForecastTimeList extends StatefulWidget {
  //final Weather weather;
  //const ForecastTimeList({required this.weather});
  @override
  _ForecastTimeListState createState() => _ForecastTimeListState();
}

class _ForecastTimeListState extends State<ForecastTimeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:20.0),
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 80.0,
            color: Colors.deepOrange[50],
            child: GestureDetector(
              onTap: () => _forecastDialog(context),
            ),
          ),
          Container(
            width: 80.0,
            color: Colors.deepOrange[100],
            child: GestureDetector(
              onTap: () => _forecastDialog(context),
            ),
          ),
          Container(
            width: 80.0,
            color: Colors.deepOrange[200],
            child: GestureDetector(
              onTap: () => _forecastDialog(context),
            ),
          ),
          Container(
            width: 80.0,
            color: Colors.deepOrange[300],
            child: GestureDetector(
              onTap: () => _forecastDialog(context),
            ),
          ),
          Container(
            width: 80.0,
            color: Colors.deepOrange[400],
            child: GestureDetector(
              onTap: () => _forecastDialog(context),
            ),
          ),
          Container(
            width: 80.0,
            color: Colors.deepOrange[500],
            child: GestureDetector(
              onTap: () => _forecastDialog(context),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _forecastDialog(BuildContext context) async {
  DateTime currentTime = await NTP.now();
  int month = currentTime.month;
  int date = currentTime.day;
  int day = currentTime.weekday;
  int hour = currentTime.hour;
  String time = (hour >= 12)? '오후':'오전';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(30),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            Align (
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Text(
              "$month.$date ($day)",
            ),
            Text(
              '$time $hour시',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [

                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'images/icon_weather/01d.png',
                    //'images/icon_weather/${weather.weatherIcon}.png',
                    width:50.0,
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text("대체로 흐림"),
                      Text("비 올 확률: 20%"),
                    ]
                )
              ],
            ),
            forecastTimeInfoRow(),
            forecastTimeInfoRow(),
            forecastTimeInfoRow(),
          ],
        ),
      );
    });
}
