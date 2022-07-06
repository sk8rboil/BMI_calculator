// ignore_for_file: prefer_const_constructors, await_only_futures, prefer_void_to_null

import 'package:bmi_calculator/homepage.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/models/data_model.dart';
import 'package:bmi_calculator/models/noti_model.dart';
import 'package:bmi_calculator/screens/login_screen.dart';
import 'package:bmi_calculator/screens/register_screen.dart';
import 'package:bmi_calculator/screens/test_provider_page1.dart';
import 'package:bmi_calculator/screens/test_provider_page2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String initialroute = '/login_screen';
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        //login already
        initialroute = '/homepage';
      }
      runApp(const MyApp());
    });
  });
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
        ChangeNotifierProvider<bmiModel>(
          create: (_) => bmiModel(age: 0, height: 0, weight: 0),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
            color: Colors.black,
          ),
        ),
        initialRoute: initialroute,
        routes: {
          '/homepage': (context) => MyHomePage(title: 'MY-LIFE'),
          '/provider_page1': (context) => MyProviderPage1(),
          '/provider_page2': (context) => MyProviderPage2(),
          '/login_screen': (context) => MyLoginScreen(),
          '/register_screen': (context) => MyRegisterScreen(),
        },
      ),
    );
  }
}
