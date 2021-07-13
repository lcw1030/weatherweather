import 'package:flutter/material.dart';
import 'package:weatherweather/forecast_time_info.dart';
import 'package:weatherweather/styles.dart';
import 'package:weatherweather/weather_api.dart';

import 'package:weatherweather/weather_api_class.dart';

class ForecastTimeList extends StatefulWidget {
  final dynamic data;
  final String type;
  ForecastTimeList({required this.data, required this.type});
  //Weather weather;
  //ForecastTimeList({required this.weather});
  @override
  _ForecastTimeListState createState() => _ForecastTimeListState();//weather:weather);
}

class _ForecastTimeListState extends State<ForecastTimeList> {
  //late HourlyWeather weatherData;
  //_ForecastTimeListState({required this.weather});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List<Widget>.generate(10, (idx) {
                Weather weatherData = extractHourlyWeather(widget.data, idx);
                var displayData = formatWeather(widget.type, weatherData);
                return Container(
                  width: 80.0,
                  height: MediaQuery.of(context).size.height,
                  child: GestureDetector(
                    onTap: () => _forecastDialog(context, displayData),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('${displayData['time']![0]}'),
                        Text('${displayData[widget.type]![3]}'),
                        //Image.asset('images/icon_weather/${displayData[widget.type]![0]}.png'),
                        Expanded(
                          flex: 3,
                          child: Image.asset('images/icon_weather/${displayData[widget.type]![1]}.png'),
                        ),
                        Text('${displayData[widget.type]![2]}'),
                      ],
                    ),
                  ),
                  /*FutureBuilder(
                    future: getHourlyData(idx),
                    builder: (context, AsyncSnapshot<Weather> snapshot) {
                      if(snapshot.hasData == false) {
                        return CircularProgressIndicator();
                      }
                      else{
                        Weather weatherData=snapshot.data!;
                        var displayData = formatWeather(widget.type, weatherData);
                        print(displayData[widget.type]);
                        //print(displayData[widget.type]![2]);
                        String time = weatherData.dt.hour >= 12 ? '오후': '오전';
                        int hour = weatherData.dt.hour > 12? weatherData.dt.hour-12: weatherData.dt.hour;
                        hour = weatherData.dt.hour == 0? 12: weatherData.dt.hour;
                        return Container(
                          width: 80.0,
                          height: MediaQuery.of(context).size.height,
                          child: GestureDetector(
                            onTap: () => _forecastDialog(context, weatherData, weatherData.dt.hour),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('$time $hour시'),
                                Text('${displayData[widget.type]![3]}'),
                                //Image.asset('images/icon_weather/${displayData[widget.type]![0]}.png'),
                                Expanded(
                                  flex: 3,
                                  child: Image.asset('images/icon_weather/${displayData[widget.type]![1]}.png'),
                                ),
                                Text('${displayData[widget.type]![2]}'),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),*/
                );
              })
            ),
          ),
        ],
      )


    );
  }
}

void _forecastDialog(BuildContext context, dynamic displayData) {

  DisplayWeather displayTemp = DisplayWeather(weatherData: '온도: ${displayData['temp']![2]}', description1: '체감: ${displayData['feelslike']![2]}', icon: 'status_temp');
  DisplayWeather displayRain = DisplayWeather(weatherData: '강수: ${displayData['rain']![3]}', description1: '${displayData['rain']![2]}', icon: '${displayData['rain']![1]}');
  DisplayWeather displayUv = DisplayWeather(weatherData: '자외선 수치: ${displayData['uv']![3]}', description1: '${displayData['uv']![2]}', icon: '${displayData['uv']![1]}');
  DisplayWeather displayWind = DisplayWeather(weatherData: '바람: ${displayData['wind']![3]}', description1: '${displayData['uv']![3]}', description2: '${displayData['wind']![2]}', icon: '${displayData['wind']![1]}');
  DisplayWeather displayHumidity = DisplayWeather(weatherData: '습도: ${displayData['humidity']![3]}', description1: '${displayData['humidity']![2]}', icon: '${displayData['humidity']![1]}');

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(5),
        backgroundColor: Styles.dialogBG,
        content: Scaffold(
          backgroundColor: Styles.dialogBG,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                Align (
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close_rounded, color: Styles.textColor),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Text('${displayData['time']![1]}'),
                Text('${displayData['time']![0]}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [

                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/icon_weather/${displayData['temp']![1]}.png',
                        width:50.0,
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text("${displayData['temp']![0]}"),
                          Text("${displayData['pop']![0]}"),
                        ]
                    )
                  ],
                ),
                Flexible(
                  child: GridView.count(
                    padding: const EdgeInsets.all(10),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    childAspectRatio: 0.8,
                    children: <Widget>[
                      forecastTimeInfo(displayTemp),
                      forecastTimeInfo(displayRain),
                      forecastTimeInfo(displayUv),
                      forecastTimeInfo(displayWind),
                      forecastTimeInfo(displayHumidity),
                      Image.asset('images/icon_weather/pinwheel.gif', height: 120),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
}
