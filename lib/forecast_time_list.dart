import 'package:flutter/material.dart';
import 'package:weatherweather/forecast_time_info.dart';
import 'package:weatherweather/styles.dart';
import 'package:weatherweather/weather_api.dart';

import 'package:weatherweather/weather_api_class.dart';

class ForecastTimeList extends StatefulWidget {
  final String type;
  ForecastTimeList({required this.type});
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
                return Container(
                  width: 80.0,
                  height: MediaQuery.of(context).size.height,
                  child: FutureBuilder(
                    future: getHourlyData(idx),
                    builder: (context, AsyncSnapshot<HourlyWeather> snapshot) {
                      if(snapshot.hasData == false) {
                        return CircularProgressIndicator();
                      }
                      else{
                        HourlyWeather weatherData=snapshot.data!;
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
                                Expanded(
                                  child: Image.asset('images/icon_weather/${snapshot.data!.weatherIcon}.png'),
                                ),
                                Text('${snapshot.data!.temp}°'),
                                Text('${widget.type}'),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              })
            ),
          ),
        ],
      )


    );
  }
}

void _forecastDialog(BuildContext context, HourlyWeather weather, int tmp) {

  int month = weather.dt.month;
  int date = weather.dt.day;
  int day = weather.dt.weekday;
  int hour = weather.dt.hour;
  String time = (hour >= 12)? '오후':'오전';
  List<String> weekday= ['월', '화', '수', '목', '금', '토', '일'];
  print('$month월 $date일 $day요일 $hour시');
  String uvDeg;
  String humidityDeg;
  if (weather.uvi < 3) {uvDeg = '낮음';}
  else if(weather.uvi < 6) {uvDeg = '보통';}
  else if(weather.uvi < 8) {uvDeg = '높음';}
  else {uvDeg = '매우 높음';}

  if (weather.humidity < 40) {humidityDeg = '낮음';}
  else if(weather.humidity < 60) {humidityDeg = '보통';}
  else if(weather.humidity < 80) {humidityDeg = '높음';}
  else {humidityDeg = '매우 높음';}
  DisplayWeather displayTemp = DisplayWeather(weatherData: '온도: ${weather.temp}°', description1: '체감: ${weather.feelsLike}°');
  DisplayWeather displayRain = DisplayWeather(weatherData: '강수: ${weather.rain}mm', description1: '없음');
  DisplayWeather displayUv = DisplayWeather(weatherData: '자외선 수치: ${weather.uvi}', description1: '$uvDeg');
  DisplayWeather displayWind = DisplayWeather(weatherData: '바람: ${weather.wind}km/h', description1: '남서', description2: '약함');
  DisplayWeather displayHumidity = DisplayWeather(weatherData: '습도: ${weather.humidity}%', description1: '$humidityDeg');

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
                Text(
                  "$month.$date (${weekday[day-1]})",
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
                        'images/icon_weather/${weather.weatherIcon}.png',
                        width:50.0,
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text("${weather.weatherDescription}"),
                          Text("비 올 확률: ${weather.pop}%"),
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
                      forecastTimeInfo('images/icon_weather/status_temp.png', displayTemp),
                      forecastTimeInfo('images/icon_weather/status_rain.png', displayRain),
                      forecastTimeInfo('images/icon_weather/status_uv.png', displayUv),
                      forecastTimeInfo('images/icon_weather/status_wind.png', displayWind),
                      forecastTimeInfo('images/icon_weather/status_humidity.png', displayHumidity),
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
/*
DisplayWeather DisplayWeatherInfo(HourlyWeather weather) {

}*/