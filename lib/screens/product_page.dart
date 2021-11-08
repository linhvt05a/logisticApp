import 'package:flutter/material.dart';
import 'package:logistic/screens/product_detail_page.dart';
import 'package:logistic/widgets/card_data.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  void navigateToProductDetail(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ProductDetail()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: ListView(
        children: [
          // CardData(onPress:(){
          //   navigateToProductDetail(context);
          // })
        ],
      ),
    );
  }
}
