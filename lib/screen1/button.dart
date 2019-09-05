import 'package:flutter/material.dart';


class ButtonJT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Icon(
                 Icons.call,
                 color: Colors.blue[300],
                 ),
                Text(
                  'CALL',
                  style: TextStyle(
                    color: Colors.blue[300],
                  ),
                  ),
              ],
            ),

          ),
          Container(
            child: Column(
              children: <Widget>[
                Icon(
                 Icons.near_me,
                 color: Colors.blue[300],
                 ),
                Text(
                  'ROUTE',
                  style: TextStyle(
                    color: Colors.blue[300],
                  ),
                  ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Icon(
                 Icons.share,
                 color: Colors.blue[300],
                 ),
                Text(
                  'SHARE',
                  style: TextStyle(
                    color: Colors.blue[300],
                  ),
                  ),
              ],
            ),

            
          ),

        ],

      ),
    );
  }
}