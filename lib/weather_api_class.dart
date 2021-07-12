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
  final String pop;
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

class DisplayWeather {
  //final String weatherIcon;
  final String weatherData;
  final String description1;
  final String? description2;
  DisplayWeather({required this.weatherData, required this.description1, this.description2});
}

Map<String, List<dynamic>> ExtractWeather(String type, Weather weather) {
  String uvDeg;
  String humidityDeg;
  String rainDeg = (weather.rain == 0) ? '없음':'있음';
  String windDeg;
  if (weather.uvi < 3) {uvDeg = '낮음';}
  else if(weather.uvi < 6) {uvDeg = '보통';}
  else if(weather.uvi < 8) {uvDeg = '높음';}
  else {uvDeg = '매우 높음';}

  if (weather.humidity < 40) {humidityDeg = '낮음';}
  else if(weather.humidity < 60) {humidityDeg = '보통';}
  else if(weather.humidity < 80) {humidityDeg = '높음';}
  else {humidityDeg = '매우 높음';}

  if(weather.windSpeed < 3) {windDeg = '없음';}
  else if(weather.windSpeed <10) {windDeg = '약함';}
  else {windDeg = '강함';}
  var displayData = {
    'temp': [weather.weatherDescription, weather.weatherIcon, '${weather.temp}°', ''],
    'feelslike': [weather.weatherDescription, weather.weatherIcon, '${weather.feelsLike}°', ''],
    'uv': ['자외선','status_uv', uvDeg, '(${weather.uvi})', ],
    'rain': ['강수','status_rain', rainDeg, '${weather.rain}mm'],
    'wind': ['바람','status_wind', windDeg, '${weather.windSpeed}km/h'],
    'humidity': ['습도','status_humidity', humidityDeg, '${weather.humidity}%'],
  };
  return displayData;

}