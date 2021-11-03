import 'package:flutter/material.dart';
import 'package:logistic/screens/login_page.dart';
import 'package:logistic/screens/product_page.dart';
import 'package:logistic/widgets/card_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void navigateToProfile(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  void navigateToProduct(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const Product()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(child: _buildList(context)),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        CardData(onPress: () {
          navigateToProduct(context);
        }),
        CardData(onPress: () {
          navigateToProduct(context);
        }),
        CardData(onPress: () {
          navigateToProduct(context);
        }),
        CardData(onPress: () {
          navigateToProduct(context);
        }),
        CardData(onPress: () {
          navigateToProduct(context);
        }),
        CardData(onPress: () {
          navigateToProduct(context);
        }),
        CardData(onPress: () {
          navigateToProduct(context);
        }),
        CardData(onPress: () {
          navigateToProduct(context);
        }),
        CardData(onPress: () {
          navigateToProduct(context);
        })
      ],
    );
  }
}
