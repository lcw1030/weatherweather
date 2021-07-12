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
    return Column(
      children: <Widget> [
        FutureBuilder(
            future: getCurrentData(),
            builder: (context, AsyncSnapshot<Weather> snapshot) {
              if (snapshot.hasData == false) {
                print('snapshot');
                return CircularProgressIndicator();
              }
              return Screen(
                type: 'temp',
                main: '${snapshot.data!.weatherDescription}',
                value: '${snapshot.data!.temp}',
                icon: '${snapshot.data!.weatherIcon}',
                description1: '최고 ${snapshot.data!.tempMax}°/최저 ${snapshot.data!.tempMin}°',
                description2: '',
              );

            },
        ),

      ],
    );
    //return Screen();
  }
}