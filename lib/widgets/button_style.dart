import 'package:flutter/material.dart';

class StyledButton extends StatefulWidget {
  final Function() onPress;
  final String title;

  const StyledButton({Key? key, required this.onPress, required this.title})
      : super(key: key);

  @override
  _StyledButtonState createState() => _StyledButtonState();
}

class _StyledButtonState extends State<StyledButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () => widget.onPress(),
        child: Container(
          alignment: Alignment.center,
          child: Text(widget.title),
          height: 46,
        ),
      ),
    );
  }
}
