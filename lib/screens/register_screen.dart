// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyRegisterScreen extends StatelessWidget {
  const MyRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  VerticalDivider(
                    width: 10,
                  ),
                  Text(
                    'REGISTER PAGE',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(),
                    TextFormField(),
                    TextFormField(),
                    TextFormField(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('REGISTER'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
