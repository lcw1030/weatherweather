import 'package:flutter/material.dart';
import 'package:weatherweather/screens/feels_like.dart';
import 'package:weatherweather/screens/humidity.dart';
import 'package:weatherweather/screens/rain.dart';
import 'package:weatherweather/screens/temp.dart';
import 'package:weatherweather/screens/uv.dart';
import 'package:weatherweather/screens/wind.dart';
import 'package:weatherweather/styles.dart';

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
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  int _currentIdx = 0;

  final List<Widget> _screens = [Temp(), FeelsLike(), Uv(), Rain(), Wind(), Humidity()];

  void _onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIdx = index;
    });
  }

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: _screens,
          physics: NeverScrollableScrollPhysics(), // No sliding
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Styles.morningBar,
            onTap: _onTap,
            currentIndex: _currentIdx,
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

    );
  }
}
