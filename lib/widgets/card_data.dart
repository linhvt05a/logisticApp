import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  const CardData(
      {Key? key, this.onPress, this.title, this.amount, this.createAt})
      : super(key: key);
  final Function()? onPress;
  final String? title;
  final String? amount;
  final String? createAt;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: onPress,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height / 6,
              // color: Colors.lightGreen,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$title',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18)),
                  Text('$amount',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18)),
                  Text('$createAt',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            )),
      ),
    );
  }
}
