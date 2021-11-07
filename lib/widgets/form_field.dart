import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logistic/controllers/controllers.dart';
import 'package:logistic/db/db_sql.dart';
import 'package:logistic/models/spending_list_model.dart';
import 'package:logistic/screens/home_page.dart';
import 'package:logistic/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        children: const [FormState()]);
  }
}

class FormState extends StatefulWidget {
  const FormState({Key? key}) : super(key: key);

  @override
  _FormStateState createState() => _FormStateState();
}

class _FormStateState extends State<FormState> {
  final f = DateFormat('dd-MM-yyyy');
  DateTime createAt = DateTime.now();
  late String currenDate = '';
  late Utils utils = Utils();
  final titleText = TextEditingController();
  final amountText = TextEditingController();
  final NoteController _noteController = Get.put(NoteController());
  void backToHome(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const HomePage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currenDate = f.format(createAt) ?? currenDate;
    utils.focusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    utils.focusNode.dispose();
    titleText.dispose();
    amountText.dispose();
    super.dispose();
  }

  Future<void> onChangeDate(date) async {
    setState(() {
      createAt = date;
    });
  }

  Future<void> confirmDate(date) async {
    // setState(() {
    //   createAt = date;
    // });
  }

  void createNote() async {
    final _notes = Note(
        // id: 0,
        title: titleText.text,
        amount: amountText.text,
        createAt: f.format(createAt),
        isComplete: 0);
    _noteController.createNote(_notes);
    backToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 46,
            child: TextFormField(
                controller: titleText,
                onTap: () {
                  utils.showKeyBoard();
                },
                focusNode: utils.focusNode,
                // autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tiêu đề ',
                  hintText: 'ex: Tiết kiệm tiền mua Macbook Pro ...  ',
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 46,
            child: TextFormField(
                controller: amountText,
                onTap: () {
                  utils.showKeyBoard();
                },
                // focusNode: utils.focusNode,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Số tiền ',
                  hintText: 'ex: 8.000.000.000 đ',
                )),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 46,
              child: TextFormField(
                  // focusNode: utils.focusNode,
                  autofocus: true,
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2021, 1),
                        maxTime: DateTime(2050, 12),
                        theme: const DatePickerTheme(), onChanged: (date) {
                      onChangeDate(date);
                    }, onConfirm: (date) {
                      confirmDate(date);
                    });
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Ngày tạo ',
                      hintText: f.format(createAt) ?? currenDate
                      // hintText: createAt
                      )),
            )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            onPressed: () {
              createNote();
            },
            child: Container(
              alignment: Alignment.center,
              child: const Text('Lưu '),
              height: 46,
            ),
          ),
        )
      ],
    ));
  }
}
