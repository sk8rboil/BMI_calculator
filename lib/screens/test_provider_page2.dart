// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/models/data_model.dart';
import 'package:bmi_calculator/models/noti_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProviderPage2 extends StatelessWidget {
  const MyProviderPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotiModel>(
      builder: (BuildContext context, notiprovidervalue, Widget? child) =>
          Scaffold(
        appBar: AppBar(
          title: Text('PROVIDER PAGE 2'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Center(
              child: Text(
                notiprovidervalue.text1,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                notiprovidervalue.text2,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                notiprovidervalue.text2 = "Change data from button";
              },
              child: Text('Change data'),
            ),
          ],
        ),
      ),
    );
  }
}
