import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  late FocusNode focusNode;

  getData(key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getInt(key);
  }

  saveData(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  void showKeyBoard() {
    focusNode.requestFocus();
  }

  void dismissKeyBoard() {
    focusNode.unfocus();
  }
}
