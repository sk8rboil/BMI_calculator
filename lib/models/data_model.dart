// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_getters_setters

class MydataProvider {
  String _text1 = 'data1 from model';

  String get text1 => _text1;
  set text1(String text1) {
    _text1 = text1;
  }

  String _text2 = '';
  String get text2 => _text2;
  set text2(String text2) {
    _text2 = text2;
  }
}
