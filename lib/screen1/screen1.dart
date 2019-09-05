import 'package:flutter/material.dart';
import './title_row.dart';
import './button.dart';
import './text_secjt.dart';
import './imageloc.dart';
import './buttonproc.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout Screen1'),
      ),
      body: ListView(
        children: <Widget>[
          ImageLoc(),
          TitleRow(),
          ButtonJT(),
          TextSectionJT(),
          ButtonProc(),
        ],
      ),
    );
  }
}
