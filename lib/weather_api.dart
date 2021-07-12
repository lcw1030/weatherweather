import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherweather/weather_api_class.dart';

const APIKEY = '54e5b04d4390d8b062b676a7c5f51957';
const LON = '127.02111111111111';
const LAT = '37.486000000000004';
const ENDPOINT = 'https://api.openweathermap.org';

Future<Weather> getCurrentData() async {
  String queryStr = '$ENDPOINT/data/2.5/onecall?lat=$LAT&lon=$LON&exclude=minutely,alerts&appid=$APIKEY&units=metric&lang=kr';
  http.Response response = await http.get(Uri.parse(queryStr));
  Weather weather;
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data["current"]);
    //print(data["hourly"][0]["temp"]["max"]);
    try {
      //weather = Weather(temp: "1", tempMax: "1", tempMin: "1", weatherMain: "1", code: 1, weatherIcon: "02d", feelsLike: "3", rain: "1", humidity: "1", wind: "1", uvi: 0.89);
      weather = Weather(
        temp: data["current"]["temp"].toString(),
        tempMax: data["daily"][0]["temp"]["max"].toString(),
        tempMin: data["daily"][0]["temp"]["min"].toString(),
        weatherMain: data["current"]["weather"][0]["main"].toString(),
        weatherDescription: data["current"]["weather"][0]["description"].toString(),
        //code: int.parse(data["weather"][0]["id"].toString()),
        weatherIcon: data["current"]["weather"][0]["icon"].toString(),
      );
    } catch (e) {
      weather = null as Weather;
      print(e);
    }
  } else {
    weather = null as Weather;
  }
  return weather;
}

Future<HourlyWeather> getHourlyData(int idx) async {
  String queryStr = '$ENDPOINT/data/2.5/onecall?lat=$LAT&lon=$LON&exclude=minutely,alerts&appid=$APIKEY&units=metric&lang=kr';
  http.Response response = await http.get(Uri.parse(queryStr));
  HourlyWeather weather;
  if (response.statusCode == 200) {
    var data = json.decode(response.body);

    /*for(int i=0; i<25; i++) {
      print(i);
      print(data["hourly"][i]["dt"]);
      var d = DateTime.fromMillisecondsSinceEpoch(int.parse(data["hourly"][i]["dt"].toString())*1000);
      print('${d.month}, ${d.day}, ${d.weekday}, ${d.hour}, ${d.minute}');
    }*/

    //print(double.parse(data["hourly"][0]["dt"].toString())*1000);
    //print(data["hourly"][0]["temp"]["max"]);
    print(data["hourly"][idx]);
    //print(data["hourly"][idx]["weather"][0]["main"]);//["weather"]["main"]);
    try {
      //var timeDath = DateTime.fromMillisecondsSinceEpoch(int.parse(data["hourly"][idx]["dt"].toString())*1000);
      //String time = ()
      //weather = Weather(temp: "1", tempMax: "1", tempMin: "1", weatherMain: "1", code: 1, weatherIcon: "02d", feelsLike: "3", rain: "1", humidity: "1", wind: "1", uvi: 0.89);
      weather = HourlyWeather(
        temp: data["hourly"][idx]["temp"].toString(),
        tempMax: data["hourly"][idx]["temp"].toString(),
        tempMin: data["hourly"][idx]["temp"].toString(),
        weatherMain: data["hourly"][idx]["weather"][0]["main"].toString(),
        weatherDescription: data["hourly"][idx]["weather"][0]["description"].toString(),
        weatherIcon: data["hourly"][idx]["weather"][0]["icon"].toString(),
        dt: DateTime.fromMillisecondsSinceEpoch(int.parse(data["hourly"][idx]["dt"].toString())*1000),
        feelsLike: data["hourly"][idx]["feels_like"].toString(),
        pop: data["hourly"][idx]["pop"].toString(),
        rain: data["hourly"][idx]["rain"]?["1h"].toString() ?? '0',
        uvi: double.parse(data["hourly"][idx]["uvi"].toString()).toInt(),
        humidity: int.parse(data["hourly"][idx]["humidity"].toString()),
        wind: data["hourly"][idx]["wind_speed"].toString(),
      );
    } catch (e) {
      weather = HourlyWeather(temp: "1", tempMax: "1", tempMin: "1", weatherMain: "1", weatherIcon: "02d", feelsLike: "3", pop: "1", rain: "1", humidity: 1, wind: "1", uvi: 7, dt: DateTime.now(), weatherDescription: 'default');

      print(e);
    }
  } else {
    weather = HourlyWeather(temp: "1", tempMax: "1", tempMin: "1", weatherMain: "1", weatherIcon: "02d", feelsLike: "3", pop: "1", rain: "1", humidity: 1, wind: "1", uvi: 7, dt: DateTime.now(), weatherDescription: 'default');

    //weather = null as HourlyWeather;
  }
  return weather;
}










