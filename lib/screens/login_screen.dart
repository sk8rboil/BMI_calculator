// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

final _formKey = GlobalKey<FormState>();
TextEditingController email_controller = TextEditingController();
TextEditingController password_controller = TextEditingController();

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY-BMI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              logoapp(context),
              loginform(context),
            ],
          ),
        ),
      ),
    );
  }

  Container logoapp(BuildContext context) {
    return Container(
      child: Lottie.asset(
        height: MediaQuery.of(context).size.height * 0.4,
        fit: BoxFit.fill,
        'assets/json/17169-smooth-healthy-animation.json',
      ),
    );
  }

  Padding loginform(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: email_controller,
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: password_controller,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('LOGIN'),
              ),
            ),
            Divider(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/register_screen');
                },
                child: Text('REGISTER'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
