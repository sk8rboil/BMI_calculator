// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/homepage.dart';
import 'package:bmi_calculator/models/data_model.dart';
import 'package:bmi_calculator/models/noti_model.dart';
import 'package:bmi_calculator/screens/test_provider_page1.dart';
import 'package:bmi_calculator/screens/test_provider_page2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MydataProvider>(
          create: (_) => MydataProvider(),
        ),
        ChangeNotifierProvider<NotiModel>(
          create: (_) => NotiModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          appBarTheme: AppBarTheme(
            color: Colors.black,
          ),
        ),
        home: const MyHomePage(title: 'BMI CALCULATOR'),
        routes: {
          '/homepage': (context) => MyHomePage(title: ''),
          '/provider_page1': (context) => MyProviderPage1(),
          '/provider_page2': (context) => MyProviderPage2(),
        },
      ),
    );
  }
}
