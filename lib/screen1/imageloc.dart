
import 'package:flutter/material.dart';

class ImageLoc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      Image.asset(
        'images/lake.jpg',
         width: 600,            
         height: 240,            
        fit: BoxFit.cover,
      ),
    );
  }
}