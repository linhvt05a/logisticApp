import 'package:flutter/material.dart';
import 'package:logistic/screens/home_page.dart';
import 'package:logistic/screens/login_page.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'fsdfsdfsdfsd',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
