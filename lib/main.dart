import 'package:flutter/material.dart';
import 'package:weatherweather/forecast_time_list.dart';
import 'package:weatherweather/styles.dart';
import 'package:weatherweather/weather_api.dart';
import 'package:weatherweather/weather_api_class.dart';
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
        primaryColor: Styles.morning,
        accentColor: Styles.morningAccent,
        primaryTextTheme: Theme.of(context).textTheme.apply(
          bodyColor: Styles.textColor,
          displayColor: Styles.textColor,
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Styles.textColor,
          displayColor: Styles.textColor,
        ),

        //primarySwatch: Colors.,
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
  int _selectedIdx = 0;
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Styles.morningBar,
        //selectedItemColor: Styles.morning,
        //unselectedItemColor: Styles.morningBar,
        selectedLabelStyle: TextStyle(color: Styles.textColor, backgroundColor: Styles.morning),
        unselectedLabelStyle: TextStyle(color: Styles.morning),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        currentIndex: _selectedIdx,
        onTap: (int idx) {
          setState(() {
            _selectedIdx = idx;
          });
        },

        items: [
          BottomNavigationBarItem(
            label: '온도',
            //title: Text('Music'),
            icon: Icon(Icons.wb_sunny),
          ),
          BottomNavigationBarItem(
            label: '체감',
            icon: Icon(Icons.wb_sunny_outlined),
          ),
          BottomNavigationBarItem(
            label: '자외선',
            icon: Icon(Icons.wb_sunny_rounded),
          ),
          BottomNavigationBarItem(
            label: '강수',
            icon: Icon(Icons.umbrella),
          ),
          BottomNavigationBarItem(
            label: '바람',
            icon: Icon(Icons.wb_cloudy),
          ),
          BottomNavigationBarItem(
            label: '습도',
            icon: Icon(Icons.water),
          ),
        ],

      ),
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_location',
                style: Theme.of(context).textTheme.headline4,
              ),
              FutureBuilder(
                  future: getCurrentData(),
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
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                    color: Styles.morningShadow,
                    offset: Offset(3,3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "오늘",
                    ),
                    _forecastTimeList,
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
