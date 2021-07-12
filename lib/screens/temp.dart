import 'package:flutter/material.dart';
import 'package:weatherweather/screen.dart';

import 'package:weatherweather/weather_api.dart';

import 'package:weatherweather/weather_api_class.dart';
class Temp extends StatefulWidget {
  //final int idx;
  //Temp({required this.idx});
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {

  @override
  Widget build(BuildContext context) {
    /*return Column(
      children: <Widget> [
        FutureBuilder(
            future: getCurrentData(),
            builder: (context, AsyncSnapshot<Weather> snapshot) {
              if (snapshot.hasData == false) {
                print('snapshot');
                return CircularProgressIndicator();
              }
              return
            }
        ),
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    //Text('종로구 공평'),
    Image.asset('images/icon_weather/${snapshot.data!.weatherIcon}.png', scale: 1.5),
    Text('${snapshot.data!.temp}°', style: Theme.of(context).textTheme.headline2),
    Text('최고 ${snapshot.data!.tempMax}°/ 최저 ${snapshot.data!.tempMin}°'),
    //Image.network('http://openweathermap.org/img/wn/${snapshot.data!.weatherIcon}@2x.png', scale: 0.4),
    Screen(
    type: '${snapshot.data!.weatherDescription}',
    description1:
    ),
    ],
    );
      ],
    );*/
    return Screen();
  }
}