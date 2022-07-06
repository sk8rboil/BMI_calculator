// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_void_to_null, avoid_print, unnecessary_new, prefer_final_fields, unused_local_variable

import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<bmiModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              signOut(context);
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: <Widget>[
                        Stack(
                          children: [
                            SizedBox(
                              height: 30,
                              child: CircleAvatar(
                                child: FittedBox(),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                              onPressed: () {},
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'DisplayName',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Reset Password'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text('data'),
            ),
            ListTile(
              onTap: () {},
              title: Text('data'),
            ),
            ListTile(
              onTap: () {},
              title: Text('data'),
            ),
            ListTile(
              onTap: () {},
              title: Text('data'),
            ),
          ],
        ),
      ),
      body: Consumer<bmiModel>(
        builder: (BuildContext context, bmivalue, Widget? child) =>
            SingleChildScrollView(
          child: Column(
            children: <Widget>[
              firstCard(context, bmivalue, counter),
              secondCard(context),
              thirdCard(context),
              calculateButton(context),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  SizedBox calculateButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/provider_page1');
        },
        child: Text('CALCULATE'),
      ),
    );
  }

  Row thirdCard(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Card(
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.male_outlined),
                    label: Text('Male'),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.female_outlined),
                    label: Text('Female'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row secondCard(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Card(
              elevation: 5,
              child: Center(child: Text('Height')),
            ),
          ),
        ),
      ],
    );
  }

  Row firstCard(BuildContext context, bmivalue, counter) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'AGE',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    counter.age.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 70,
                        child: FittedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              elevation: 5,
                            ),
                            onPressed: () {
                              counter.addAge();
                            },
                            child: Icon(
                              Icons.add,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: FittedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              shape: CircleBorder(),
                            ),
                            onPressed: () {
                              counter.removeAge();
                            },
                            child: Icon(
                              Icons.remove,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'WEIGHT',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    counter.weight.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 70,
                        child: FittedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              elevation: 5,
                            ),
                            onPressed: () {
                              counter.addWeight();
                            },
                            child: Icon(
                              Icons.add,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: FittedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              shape: CircleBorder(),
                            ),
                            onPressed: () {
                              counter.removeWeight();
                            },
                            child: Icon(
                              Icons.remove,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future<Null> signOut(context) async {
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.signOut().then((value) {
      print('SignOut!');
      Navigator.pushReplacementNamed(context, '/login_screen');
    });
  });
}
