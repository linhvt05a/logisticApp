import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:logistic/controllers/controllers.dart';
import 'package:logistic/managements/spending_management.dart';
import 'package:logistic/models/spending_list_model.dart';
import 'package:logistic/widgets/card_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToCreateSpending(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const SpendingManagement()));
  }
  final NoteController _noteController = Get.put(NoteController());
  List<Note> _notes = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future getData() async {
    List<Note> notes = await _noteController.getNotes();
    setState(() {
      _notes = notes;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(child: _buildList(context)),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToCreateSpending(context);
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _notes.length,
      itemBuilder: (context, index) {
        final _data = _notes[index];
        return CardData(
            onPress: () async {
              _noteController.deleteNote(_data.id!);
              getData();
            },
            title: _data.title,
            amount: _data.amount,
            createAt: _data.createAt);
      },
      padding: const EdgeInsets.all(8),
    );
  }
}
