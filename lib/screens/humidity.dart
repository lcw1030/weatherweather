import 'package:flutter/material.dart';

class Humidity extends StatefulWidget {
  @override
  _HumidityState createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Humidity'),
    );
  }
}