import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const APIKEY = '54e5b04d4390d8b062b676a7c5f51957';
const LON = '127.02111111111111';
const LAT = '37.486000000000004';
const ENDPOINT = 'https://api.openweathermap.org';

class Weather {
  final String temp;
  final String tempMin;
  final String tempMax;
  final String weatherMain;
  final int code;
  final String weatherIcon;
  final String feelsLike;
  final String rain;
  final String humidity;
  final String wind;

  Weather({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weatherMain,
    required this.code,
    required this.weatherIcon,
    required this.feelsLike,
    required this.rain,
    required this.humidity,
    required this.wind,
  });
}

Future<Weather> getData() async {
  String queryStr = '$ENDPOINT/data/2.5/weather?lat=$LAT&lon=$LON&appid=$APIKEY&units=metric';
  http.Response response = await http.get(Uri.parse(queryStr));;
  Weather weather;
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    try {
      weather = Weather(
        temp: data["main"]["temp"].toString(),
        tempMax: data["main"]["temp_max"].toString(),
        tempMin: data["main"]["temp_min"].toString(),
        weatherMain: data["weather"][0]["main"].toString(),
        code: int.parse(data["weather"][0]["id"].toString()),
        weatherIcon: data["weather"][0]["icon"].toString(),
        feelsLike: data["main"]["feels_like"].toString(),
        rain: data["rain"]["rain.1h"].toString(),
        humidity: data["main"]["humidity"].toString(),
        wind: data["wind"]["wind.1h"].toString(),
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