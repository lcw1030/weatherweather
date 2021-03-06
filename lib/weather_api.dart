import 'dart:math';import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherweather/weather_api_class.dart';

const APIKEY = '54e5b04d4390d8b062b676a7c5f51957';
const LON = '126';
const LAT = '37';
const ENDPOINT = 'https://api.openweathermap.org';

Future<dynamic> getData() async{
  String queryStr = '$ENDPOINT/data/2.5/onecall?lat=$LAT&lon=$LON&exclude=minutely,alerts&appid=$APIKEY&units=metric&lang=kr';
  http.Response response = await http.get(Uri.parse(queryStr));
  var data;
  if (response.statusCode == 200) {
    data = json.decode(response.body);
  } else {
    data = 0;
  }
  return data;
}

Weather extractCurrentWeather(dynamic data) {
  Weather weather = Weather(
    temp: data["current"]["temp"].toString(),
    tempMax: data["daily"][0]["temp"]["max"].toString(),
    tempMin: data["daily"][0]["temp"]["min"].toString(),
    weatherMain: data["current"]["weather"][0]["main"].toString(),
    weatherDescription: data["current"]["weather"][0]["description"].toString(),
    //code: int.parse(data["weather"][0]["id"].toString()),
    weatherIcon: data["current"]["weather"][0]["icon"].toString(),
    dt: DateTime.fromMillisecondsSinceEpoch(int.parse(data["current"]["dt"].toString())*1000),
    feelsLike: data["current"]["feels_like"].toString(),
    pop: int.parse(data["hourly"][0]["pop"].toString()),
    rain: double.parse(data["current"]["rain"]?["1h"].toString()?? '0'),
    uvi: double.parse(data["current"]["uvi"].toString()).toInt(),
    humidity: int.parse(data["current"]["humidity"].toString()),
    windSpeed: double.parse(data["current"]["wind_speed"].toString()),
    windDirection: data["current"]["wind_deg"].toString(),
  );
  return weather;
}

Weather extractHourlyWeather(dynamic data, int idx) {
  Weather weather;
  try {
    weather = Weather(
      temp: data["hourly"][idx]["temp"].toString(),
      tempMax: data["hourly"][idx]["temp"].toString(),
      tempMin: data["hourly"][idx]["temp"].toString(),
      weatherMain: data["hourly"][idx]["weather"][0]["main"].toString(),
      weatherDescription: data["hourly"][idx]["weather"][0]["description"].toString(),
      weatherIcon: data["hourly"][idx]["weather"][0]["icon"].toString(),
      dt: DateTime.fromMillisecondsSinceEpoch(int.parse(data["hourly"][idx]["dt"].toString())*1000),
      feelsLike: data["hourly"][idx]["feels_like"].toString(),
      pop: int.parse(data["hourly"][idx]["pop"].toString()),
      rain: double.parse(data["hourly"][idx]["rain"]?["1h"].toString()?? '0'),
      uvi: double.parse(data["hourly"][idx]["uvi"].toString()).toInt(),
      humidity: int.parse(data["hourly"][idx]["humidity"].toString()),
      windSpeed: double.parse(data["hourly"][idx]["wind_speed"].toString()),
      windDirection: data["hourly"][idx]["wind_deg"].toString(),
    );
  } catch (e) {
    weather = Weather(temp: "0", tempMax: "0", tempMin: "0", weatherMain: "0", weatherIcon: "01d", feelsLike: "0", pop: 0, rain: 0, humidity: 0, windSpeed: 0, windDirection: '0', uvi: 0, dt: DateTime.now(), weatherDescription: 'default');

    print(e);
  }

  return weather;
}
/*
Future<Weather> getCurrentData() async {
  String queryStr = '$ENDPOINT/data/2.5/onecall?lat=$LAT&lon=$LON&exclude=minutely,alerts&appid=$APIKEY&units=metric&lang=kr';
  http.Response response = await http.get(Uri.parse(queryStr));
  Weather weather;
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data["current"]);
    print(data["current"]["feels_like"]);
    //print(data["daily"]["pop"]);
    print(data["current"]["rain"]?["1h"]);
    print(data["current"]["uvi"]);
    print(data["current"]["humidity"]);
    print(data["current"]["wind_speed"]);
    print(data["current"]["wind_deg"]);
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
        dt: DateTime.fromMillisecondsSinceEpoch(int.parse(data["current"]["dt"].toString())*1000),
        feelsLike: data["current"]["feels_like"].toString(),
        pop: '0',//data["daily"]["pop"].toString(),
        rain: double.parse(data["current"]["rain"]?["1h"].toString()?? '0'),
        uvi: double.parse(data["current"]["uvi"].toString()).toInt(),
        humidity: int.parse(data["current"]["humidity"].toString()),
        windSpeed: double.parse(data["current"]["wind_speed"].toString()),
        windDirection: data["current"]["wind_deg"].toString(),
      );
    } catch (e) {
      //weather = null as Weather;
      weather = Weather(temp: "0", tempMax: "0", tempMin: "0", weatherMain: "0", weatherIcon: "01d", feelsLike: "0", pop: "0", rain: 0, humidity: 0, windSpeed: 0, windDirection: '0', uvi: 0, dt: DateTime.now(), weatherDescription: 'default');

      print(e);
    }
  } else {
    weather = Weather(temp: "0", tempMax: "0", tempMin: "0", weatherMain: "0", weatherIcon: "01d", feelsLike: "0", pop: "0", rain: 0, humidity: 0, windSpeed: 0, windDirection: '0', uvi: 0, dt: DateTime.now(), weatherDescription: 'default');

    //weather = null as Weather;
  }
  return weather;
}

Future<Weather> getHourlyData(int idx) async {
  String queryStr = '$ENDPOINT/data/2.5/onecall?lat=$LAT&lon=$LON&exclude=minutely,alerts&appid=$APIKEY&units=metric&lang=kr';
  http.Response response = await http.get(Uri.parse(queryStr));
  Weather weather;
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
    //print(data["hourly"][idx]);
    //print(data["hourly"][idx]["weather"][0]["main"]);//["weather"]["main"]);
    try {
      //var timeDath = DateTime.fromMillisecondsSinceEpoch(int.parse(data["hourly"][idx]["dt"].toString())*1000);
      //String time = ()
      //weather = Weather(temp: "1", tempMax: "1", tempMin: "1", weatherMain: "1", code: 1, weatherIcon: "02d", feelsLike: "3", rain: "1", humidity: "1", wind: "1", uvi: 0.89);
      weather = Weather(
        temp: data["hourly"][idx]["temp"].toString(),
        tempMax: data["hourly"][idx]["temp"].toString(),
        tempMin: data["hourly"][idx]["temp"].toString(),
        weatherMain: data["hourly"][idx]["weather"][0]["main"].toString(),
        weatherDescription: data["hourly"][idx]["weather"][0]["description"].toString(),
        weatherIcon: data["hourly"][idx]["weather"][0]["icon"].toString(),
        dt: DateTime.fromMillisecondsSinceEpoch(int.parse(data["hourly"][idx]["dt"].toString())*1000),
        feelsLike: data["hourly"][idx]["feels_like"].toString(),
        pop: data["hourly"][idx]["pop"].toString(),
        rain: double.parse(data["hourly"][idx]["rain"]?["1h"].toString()?? '0'),
        uvi: double.parse(data["hourly"][idx]["uvi"].toString()).toInt(),
        humidity: int.parse(data["hourly"][idx]["humidity"].toString()),
        windSpeed: double.parse(data["hourly"][idx]["wind_speed"].toString()),
        windDirection: data["hourly"][idx]["wind_deg"].toString(),
      );
    } catch (e) {
      weather = Weather(temp: "0", tempMax: "0", tempMin: "0", weatherMain: "0", weatherIcon: "01d", feelsLike: "0", pop: "0", rain: 0, humidity: 0, windSpeed: 0, windDirection: '0', uvi: 0, dt: DateTime.now(), weatherDescription: 'default');

      print(e);
    }
  } else {
    weather = Weather(temp: "0", tempMax: "0", tempMin: "0", weatherMain: "0", weatherIcon: "01d", feelsLike: "0", pop: "0", rain: 0, humidity: 0, windSpeed: 0, windDirection: '0', uvi: 0, dt: DateTime.now(), weatherDescription: 'default');

    //weather = null as HourlyWeather;
  }
  return weather;
}
*/
Future<Air> getAirData() async {
  List<String> airDeg = ['Good', 'Fair', 'Moderate', 'Poor', 'Very Poor'];
  String queryStr = '$ENDPOINT/data/2.5/air_pollution?lat=$LAT&lon=$LON&appid=$APIKEY';
  http.Response response = await http.get(Uri.parse(queryStr));
  Air air;
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data["list"][0]["main"]["aqi"]);
    try {
      air = Air(
        quality: airDeg[int.parse(data["list"][0]["main"]["aqi"].toString())-1],
      );
    } catch (e) {
      air = Air(quality: airDeg[0]);
      print(e);
    }
  } else {
    air = Air(quality: airDeg[0]);
  }
  return air;
}

Map<String, List<dynamic>> formatWeather(String type, Weather weather) {
  String uvDeg;
  String humidityDeg;
  String rainDeg = (weather.rain == 0) ? '??????':'??????';
  String windDeg;
  String time = weather.dt.hour >= 12 ? '??????': '??????';
  int hour = weather.dt.hour > 12? weather.dt.hour-12: weather.dt.hour;
  hour = weather.dt.hour == 0? 12: weather.dt.hour;
  List<String> weekday= ['???', '???', '???', '???', '???', '???', '???'];

  if (weather.uvi < 3) {uvDeg = '??????';}
  else if(weather.uvi < 6) {uvDeg = '??????';}
  else if(weather.uvi < 8) {uvDeg = '??????';}
  else {uvDeg = '?????? ??????';}

  if (weather.humidity < 40) {humidityDeg = '??????';}
  else if(weather.humidity < 60) {humidityDeg = '??????';}
  else if(weather.humidity < 80) {humidityDeg = '??????';}
  else {humidityDeg = '?????? ??????';}

  if(weather.windSpeed < 3) {windDeg = '??????';}
  else if(weather.windSpeed <10) {windDeg = '??????';}
  else {windDeg = '??????';}
  var displayData = {
    'time': ['$time $hour???', '${weather.dt.month}.${weather.dt.day} (${weekday[weather.dt.weekday - 1]})'],
    'temp': [weather.weatherDescription, weather.weatherIcon, '${weather.temp}??', ''],
    'feelslike': [weather.weatherDescription, weather.weatherIcon, '${weather.feelsLike}??', ''],
    'uv': ['?????????','status_uv', uvDeg, '(${weather.uvi})', ],
    'rain': ['??????','status_rain', rainDeg, '${weather.rain}mm'],
    'wind': ['??????','status_wind', windDeg, '${weather.windSpeed}km/h', '${weather.windDirection}'],
    'humidity': ['??????','status_humidity', humidityDeg, '${weather.humidity}%'],
    'pop': ['??? ??? ??????: ${weather.pop}%'],
  };
  return displayData;

}








