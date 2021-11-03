import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
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
  final prefs = SharedPreferences.getInstance();
  late Utils utils = Utils();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void backToHome(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
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
    super.dispose();
  }

  Future<void> onChangeDate(date) async {
    setState(() {
      createAt = date;
    });
  }

  Future<void> confirmDate(date) async {
    setState(() {
      createAt = date;
    });
  }

  Future<void> saveData() async {
    final SharedPreferences prefs = await _prefs;
    final _createAt = await prefs.setString('createAt', f.format(createAt));
    if (_createAt) {
      backToHome(context);
    }
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
                onTap: () {
                  utils.showKeyBoard();
                },
                focusNode: utils.focusNode,
                autofocus: true,
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
                onTap: () {
                  utils.showKeyBoard();
                },
                focusNode: utils.focusNode,
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
                  focusNode: utils.focusNode,
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
              saveData();
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
