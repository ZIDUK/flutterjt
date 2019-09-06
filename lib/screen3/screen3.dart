//User detail

import 'package:flutter/material.dart';
import '../screen2/usuarios.dart';

class Screen3 extends StatelessWidget {

  final User user;

  Screen3(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.title),
      ),
    );
  }
}