import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final Function() onPress;
  final String title;
  final String amount;
  final String createAt;

  const CardItem(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.amount,
      required this.createAt})
      : super(key: key);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            child: InkWell(
      splashColor: Colors.green.withAlpha(30),
      // onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height / 6,
        // color: Colors.lightGreen,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.lightGreen),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: const TextStyle(color: Colors.white, fontSize: 18)),
                  Text(widget.amount,
                      style: const TextStyle(color: Colors.white, fontSize: 18)),
                  Text(widget.createAt,
                      style: const TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      alignment: Alignment.topRight,
                      icon: const Icon(Icons.delete),
                      iconSize: 24.0,
                      color: Colors.red,
                      onPressed: () {
                        widget.onPress();
                      },
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    )));
  }
}
