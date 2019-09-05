import 'package:flutter/material.dart';
import '../screen2/screen2.dart';


class ButtonProc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
            child: Text('Launch screen'),
            
              onPressed: () {
              // Navigate to the second screen when tapped.
              Navigator.push(context,
               MaterialPageRoute(builder: (context) => Screen2('jonathan', 'pardo')));
              },
            ),
    );
  }
}