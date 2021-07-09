import 'package:flutter/material.dart';
import 'package:weatherweather/forecast_time_list.dart';
import 'package:weatherweather/current_weather_api.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhetherWhether',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'weather weather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  String _location = '서초구 서초1동';

  String _day = '오늘';
  Widget _forecastTimeList = ForecastTimeList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_location',
              style: Theme.of(context).textTheme.headline4,
            ),
            FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot<Weather> snapshot) {
                if (snapshot.hasData == false) {
                  print('snapshot');
                  return CircularProgressIndicator();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${snapshot.data!.weatherMain}'),
                    Image.asset('images/icon_weather/${snapshot.data!.weatherIcon}.png', scale: 1.5),
                    Text('${snapshot.data!.temp}°', style: Theme.of(context).textTheme.headline2),
                    Text('최고 ${snapshot.data!.tempMax}°/ 최저 ${snapshot.data!.tempMin}°'),
                    //Image.network('http://openweathermap.org/img/wn/${snapshot.data!.weatherIcon}@2x.png', scale: 0.4),
                  ],
                );
              }
            ),


            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "오늘",
                    style: TextStyle(backgroundColor: Colors.lightBlue, color: Colors.white),
                  ),
                  _forecastTimeList,
                ],
              ),
            ),

          ],
        ),

      )
    );
  }
}
