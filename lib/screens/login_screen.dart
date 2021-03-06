// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_print, unused_element, prefer_void_to_null

/* import 'package:bmi_calculator/models/user_model.dart'; */
import 'package:bmi_calculator/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

final formKey = GlobalKey<FormState>();
TextEditingController email_controller = TextEditingController();
TextEditingController password_controller = TextEditingController();
UserModel user =
    UserModel(email: '', username: '', password: '', repassword: '');

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY-BMI'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
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
        key: formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '??????????????????????????????????????????';
                  } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return '???????????????????????????????????????????????????????????????????????????';
                  } else {
                    return null;
                  }
                },
                controller: email_controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty && value.length < 8) {
                    return '?????????????????????????????????????????????????????????????????? 8 ?????????';
                  } else {
                    return null;
                  }
                },
                controller: password_controller,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    formKey.currentState!.save();

                    user.email = email_controller.text;
                    user.password = password_controller.text;
                    signinwithEmailandPass(context);
                  }
                },
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

Future<Null> signinwithEmailandPass(context) async {
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user.email, password: user.password)
        .then((value) {
      print('signin Success!');
      print('email: ${user.email}');
      print('password: ${user.password}');

      Navigator.pushReplacementNamed(context, '/homepage')
          .catchError((onError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error'),
            backgroundColor: Colors.redAccent,
          ),
        );
      });
    });
  });
}
