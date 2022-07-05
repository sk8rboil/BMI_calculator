// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_void_to_null, avoid_print

import 'package:bmi_calculator/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController repassword = TextEditingController();
TextEditingController username = TextEditingController();
UserModel user =
    UserModel(email: '', username: '', password: '', repassword: '');

class MyRegisterScreen extends StatelessWidget {
  const MyRegisterScreen({Key? key}) : super(key: key);

  Future<Null> firebasestatus(context) async {
    await Firebase.initializeApp().then((value) async {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password)
          .then((value) async {
        await value.user!.updateDisplayName(user.username).then((value) {
          print(user.username);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    VerticalDivider(
                      width: 10,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'REGISTER PAGE',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณาชื่อผู้ใช้งาน';
                              } else {
                                return null;
                              }
                            },
                            controller: username,
                            decoration: InputDecoration(
                              hintText: 'Username',
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกอีเมล';
                              } else if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return 'กรุณาตรวจสอบอีเมลอีกครั้ง';
                              } else {
                                return null;
                              }
                            },
                            controller: email,
                            decoration: InputDecoration(
                              hintText: 'Email',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณารหัสผ่าน';
                              } else {
                                return null;
                              }
                            },
                            controller: password,
                            decoration: InputDecoration(
                              hintText: 'Password',
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณารหัสผ่าน';
                              } else {
                                return null;
                              }
                            },
                            controller: repassword,
                            decoration: InputDecoration(
                              hintText: 'Repassword',
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                _formKey.currentState!.save();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                                user.email = email.text;
                                user.password = password.text;
                                user.username = username.text;
                                user.repassword = repassword.text;

                                firebasestatus(context);
                                print('user: ${user.email}');
                                print('user: ${user.password}');
                                print('user: ${user.repassword}');
                                print('user: ${user.username}');
                              }
                            },
                            child: Text('REGISTER'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
