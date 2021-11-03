import 'package:flutter/material.dart';
import 'package:logistic/managements/spending_management.dart';
import 'package:logistic/utils/utils.dart';
import 'package:logistic/widgets/card_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final utils = Utils();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // const key = 'createAt';
    // final value =  utils.getData(key) ?? '';
    // print('read: $value');
   getData();
  }

  Future<void> getData() async {
    final value = await _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('createAt') ?? '');
    });
    print('fsdf: $value');
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
    return ListView(
      children: [
        CardData(onPress: () {
          // navigateToProduct(context);
        }),
      ],
    );
  }
}
