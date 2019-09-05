import 'package:flutter/material.dart';
//import '../screen1/screen1.dart';

class Screen2 extends StatelessWidget {
  final String nombre;
  final String apellido;

  Screen2(this.nombre, this.apellido);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body:
        Center(
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               
              Text('Esta data viene de otro screen: ' + nombre),

              Container(
              child: RaisedButton(
                child: Text('Launch screen'),
                onPressed: () {
                  // Navigate to the second screen when tapped.
                  // Navigator.push(context,
                  //MaterialPageRoute(builder: (context) => Screen2()));
                  },
                )
              ),
              
            ],

            ),


            

          ),
    );
  }
}
