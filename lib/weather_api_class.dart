class Weather {
  final String temp;
  final String tempMin;
  final String tempMax;
  final String weatherMain;
  final String weatherDescription;
  //final int code;
  final String weatherIcon;
  final DateTime dt;
  final String feelsLike;
  final int pop;
  final double? rain;
  final int uvi;
  final int humidity;
  final double windSpeed;
  final String windDirection;

  Weather({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weatherMain,
    required this.weatherDescription,
    //required this.code,
    required this.weatherIcon,
    required this.dt,
    required this.feelsLike,
    required this.pop,
    this.rain,
    required this.uvi,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
  });
}
/*
class HourlyWeather extends Weather {
  final DateTime dt;
  final String feelsLike;
  final String pop;
  final double? rain;
  final int uvi;
  final int humidity;
  final double windSpeed;
  final String windDirection;

  HourlyWeather({
    temp,
    tempMin,
    tempMax,
    weatherMain,
    weatherDescription,
    weatherIcon,
    required this.dt,
    required this.feelsLike,
    required this.pop,
    this.rain,
    required this.uvi,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
  }) : super(
      temp: temp,
      tempMin: tempMin,
      tempMax: tempMax,
      weatherMain: weatherMain,
      weatherDescription: weatherDescription,
      weatherIcon: weatherIcon);
}*/

class Air {
  final String quality;
  Air({required this.quality});
}

class DisplayWeather {
  //final String weatherIcon;
  final String weatherData;
  final String description1;
  final String? description2;
  final String icon;
  DisplayWeather({required this.weatherData, required this.description1, this.description2, required this.icon});
}

