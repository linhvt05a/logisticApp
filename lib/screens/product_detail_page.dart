import 'package:flutter/material.dart';
import 'package:logistic/widgets/card_data.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: ListView(
        children: const [
          CardData()
        ],
      ),
    );
  }
}
