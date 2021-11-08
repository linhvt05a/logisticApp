import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logistic/controllers/controllers.dart';
import 'package:logistic/models/priority_list.dart';
import 'package:logistic/models/spending_list_model.dart';
import 'package:logistic/screens/home_page.dart';
import 'package:logistic/utils/utils.dart';
import 'package:logistic/widgets/button_style.dart';
import 'package:logistic/widgets/form_input_field.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        children: const [FormValueState()]);
  }
}

class FormValueState extends StatefulWidget {
  const FormValueState({Key? key}) : super(key: key);

  @override
  _FormValueState createState() => _FormValueState();
}

class _FormValueState extends State<FormValueState> {
  final f = DateFormat('dd-MM-yyyy');
  DateTime createAt = DateTime.now();
  late String currenDate = '';
  late Utils utils = Utils();
  final titleText = TextEditingController();
  final amountText = TextEditingController();
  final NoteController _noteController = Get.put(NoteController());
  final List<NoteColors> priority = [
    NoteColors(id: 1, colors: Colors.green),
    NoteColors(id: 2, colors: Colors.red),
    NoteColors(id: 3, colors: Colors.yellow)
  ];

  final _formKey = GlobalKey<FormState>();

  void backToHome(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const HomePage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currenDate = f.format(createAt);
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
    setState(() {
      createAt = date;
    });
  }

  Future<void> createNote() async {
    final _notes = Note(
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
        key: _formKey,
        child: Column(
          children: [
            FormInputField(
              onTap: () {},
              controller: titleText,
              labelText: 'Tiêu đề',
              hintText: 'Eg: Đi xem phim...',
              focusNode: utils.focusNode,
            ),
            FormInputField(
                onTap: () {},
                controller: amountText,
                labelText: 'Số tiền phải chi ',
                hintText: 'Eg: 8.888.888'),
            FormInputField(
              labelText: 'Ngày chi',
              hintText: currenDate,
              focusNode: utils.focusNode,
              onTap: () async {
                createAt = (await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2050)))!;
                setState(() {
                  currenDate = f.format(createAt);
                });
              },
            ),
            StyledButton(
              onPress: () {
                if (titleText.text == "" || amountText.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Some field invalid '),
                        backgroundColor: Colors.red),
                  );
                } else {
                  createNote();
                }
              },
              title: 'Lưu',
            )
          ],
        ));
  }
}
