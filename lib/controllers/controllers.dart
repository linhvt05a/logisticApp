import 'package:get/get.dart';
import 'package:logistic/db/db_sql.dart';
import 'package:logistic/models/spending_list_model.dart';

class NoteController extends GetxController {
  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();

  }

  Future<void> createNote(Note note) async {
    return await DBHelper.addNote(note);
  }

  Future getNotes() async {
    return await DBHelper.getListNote();;
  }

  Future<void> deleteNote(int id) async {
    return await DBHelper.deleteNote(id);
  }
}
