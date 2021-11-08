import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/db/db_sql.dart';
import 'package:logistic/screens/home_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      getPages: [GetPage(name: '/', page: () => const HomePage())],
      debugShowCheckedModeBanner: false,
    );
  }
}
