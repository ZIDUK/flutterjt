import 'package:flutter/material.dart';
import 'screen1/screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Screen1(),
    );
  }
}
