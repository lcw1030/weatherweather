import 'package:flutter/material.dart';
import 'package:weatherweather/styles.dart';
import 'package:weatherweather/weather_api.dart';
import 'package:weatherweather/weather_api_class.dart';
import 'package:weatherweather/forecast_time_list.dart';
class Screen extends StatefulWidget {
  final String type;
  final String main;
  final String icon;
  final String value;
  final String description1;
  final String description2;
  //final int idx;
  //Screen({required this.idx});
  Screen({
    required this.type,
    required this.main,
    required this.icon,
    required this.value,
    required this.description1,
    required this.description2});
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {


  @override
  Widget build(BuildContext context) {
    Widget _forecastTimeList = ForecastTimeList(type: widget.type);
    //print(widget.value);
    return Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
        ),
        //height: double.infinity,
        //height: MediaQuery.of(context).size.height*0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              '종로구 공평동',
              style: Theme.of(context).textTheme.headline4,
            ),
            Image.asset('images/icon_weather/${widget.icon}.png', scale: 1.5),
            Text('${widget.value}', style: Theme.of(context).textTheme.headline2),
            Text('${widget.description1}'),
            Text('${widget.description2}'),

            /*FutureBuilder(
              future: getCurrentData(),
              builder: (context, AsyncSnapshot<Weather> snapshot) {
                if (snapshot.hasData == false) {
                  print('snapshot');
                  return CircularProgressIndicator();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Text('${widget.type}'),
                    Image.asset('images/icon_weather/${snapshot.data!.weatherIcon}.png', scale: 1.5),
                    Text('${snapshot.data!.temp}°', style: Theme.of(context).textTheme.headline2),
                    Text('최고 ${snapshot.data!.tempMax}°/ 최저 ${snapshot.data!.tempMin}°'),
                    //Image.network('http://openweathermap.org/img/wn/${snapshot.data!.weatherIcon}@2x.png', scale: 0.4),
                  ],
                );
              }
          ),*/
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height*0.2,
              decoration: BoxDecoration(
                color: Styles.morningBox,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Styles.morningShadow,
                    offset: Offset(3,3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Expanded(
                  Container(
                    color: Styles.morningAccent,
                    child: Text(
                      "오늘",
                    ),
                  ),
                  //),
                  _forecastTimeList,
                ],
              ),
            ),
          ],
        ),
      );
  }
}
