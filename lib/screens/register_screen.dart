// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyRegisterScreen extends StatelessWidget {
  const MyRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Text('REGISTER SCREEN'),
        ],
      ),
    );
  }
}
