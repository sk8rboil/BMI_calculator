// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types

import 'package:flutter/foundation.dart';

class bmiModel extends ChangeNotifier {
  int age = 0;
  int height = 0;
  int weight = 0;
  bmiModel({
    required this.age,
    required this.height,
    required this.weight,
  });

  void addAge() {
    age = age++;
    notifyListeners();
  }
}
