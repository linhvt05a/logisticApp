import 'package:flutter/material.dart';

class FormInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final double? height;
  final Function() onTap;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const FormInputField({Key? key,
    this.controller,
    required this.labelText,
    required this.hintText,
    this.height,
    required this.onTap,
    this.validator, this.focusNode})
      : super(key: key);

  @override
  _FormInputFieldState createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 46,
        child: TextFormField(
            validator: (value) {
              widget.validator!(value);
            },
            onTap: () => widget.onTap(),
            controller: widget.controller,
            focusNode: widget.focusNode,
            autofocus: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: widget.labelText,
              hintText: widget.hintText,
            )),
      ),
    );
  }
}
