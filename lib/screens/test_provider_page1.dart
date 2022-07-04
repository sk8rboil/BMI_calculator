// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bmi_calculator/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProviderPage1 extends StatefulWidget {
  const MyProviderPage1({Key? key}) : super(key: key);

  @override
  State<MyProviderPage1> createState() => _MyProviderPage1State();
}

class _MyProviderPage1State extends State<MyProviderPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROVIDER PAGE 1'),
        centerTitle: true,
      ),
      body: Consumer<MydataProvider>(
        builder: (BuildContext context, providervalue, Widget? child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                providervalue.text1,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'DATA2',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    providervalue.text1 = "Change text1";
                  });

                  Navigator.pushNamed(context, '/provider_page2');
                },
                child: Text('PAGE2'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
