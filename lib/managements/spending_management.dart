import 'package:flutter/material.dart';
import 'package:logistic/widgets/form_field.dart';

class SpendingManagement extends StatelessWidget {
  const SpendingManagement({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý chi tiêu'),
      ),
      body: const TextFieldForm(),
    );
  }
}
