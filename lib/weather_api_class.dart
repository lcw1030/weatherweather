class Weather {
  final String temp;
  final String tempMin;
  final String tempMax;
  final String weatherMain;
  final String weatherDescription;
  //final int code;
  final String weatherIcon;

  Weather({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weatherMain,
    required this.weatherDescription,
    //required this.code,
    required this.weatherIcon,

  });
}

class HourlyWeather extends Weather {
  final DateTime dt;
  final String feelsLike;
  final String? rain;
  final int uvi;
  final int humidity;
  final String wind;

  HourlyWeather({
    temp,
    tempMin,
    tempMax,
    weatherMain,
    weatherDescription,
    weatherIcon,
    required this.dt,
    required this.feelsLike,
    required this.rain,
    required this.uvi,
    required this.humidity,
    required this.wind,
  }) : super(
      temp: temp,
      tempMin: tempMin,
      tempMax: tempMax,
      weatherMain: weatherMain,
      weatherDescription: weatherDescription,
      weatherIcon: weatherIcon);
}

class DisplayWeather {
  //final String weatherIcon;
  final String weatherData;
  final String description1;
  final String? description2;
  DisplayWeather({required this.weatherData, required this.description1, this.description2});
}