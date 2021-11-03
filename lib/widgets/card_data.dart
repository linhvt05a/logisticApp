import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  const CardData({Key? key, this.onPress}) : super(key: key);
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: onPress,
            child: Container(
              height: MediaQuery.of(context).size.height / 6,
              // color: Colors.lightGreen,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.blue),
            )),
      ),
    );
  }
}

class CardsIcons {}
