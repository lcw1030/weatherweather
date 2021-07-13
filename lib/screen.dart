import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherweather/styles.dart';
import 'package:weatherweather/weather_api.dart';
import 'package:weatherweather/weather_api_class.dart';
import 'package:weatherweather/forecast_time_list.dart';
class Screen extends StatefulWidget {
  final String type;
  final String main;
  final String icon;
  final String value;
  final String description1;
  final String description2;
  final dynamic data;
  //final int idx;
  //Screen({required this.idx});
  Screen({
    required this.type,
    required this.main,
    required this.icon,
    required this.value,
    required this.description1,
    required this.description2,
    required this.data
  });
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {


  @override
  Widget build(BuildContext context) {
    Widget _forecastTimeList = ForecastTimeList(data: widget.data, type: widget.type);
    //print(widget.value);
    return Container(
        color: Theme.of(context).primaryColor,
        //padding: EdgeInsets.all(5),

        //height: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              '종로구 공평동',
              style: Theme.of(context).textTheme.headline4,
            ),
            Image.asset('images/icon_weather/${widget.icon}.png', scale: 1.5),
            Text('${widget.value}', style: Theme.of(context).textTheme.headline2),
            Text('${widget.description1}'),
            Text('${widget.description2}'),
            Row(
              children: <Widget>[
                Spacer(flex: 1),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Styles.morningBox,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),

                  ),
                  child: GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) => CupertinoActionSheet(
                          title: const Text('Title'),
                          message: Container(
                            child: Column(
                              children: <Widget> [
                                Text('종로구 공평동'),
                                Image.asset('images/icon_weather/air_good.png'),
                              ],
                            ),
                          ),
                          actions: [],
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Image.asset('images/icon_weather/air_good.png', scale:8),
                        ),
                        Text("미세미세\n양호"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              //height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Styles.morningBox,
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
                  //Expanded(
                  Container(
                    color: Styles.morningAccent,
                    child: Text(
                      "오늘",
                    ),
                  ),
                  //),
                  _forecastTimeList,
                ],
              ),
            ),
          ],
        ),
      );
  }
}
