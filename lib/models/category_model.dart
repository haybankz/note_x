import 'package:flutter/foundation.dart';
import 'package:note_x/data/database_helper.dart';
import 'package:note_x/models/note_model.dart';

class CategoryModel extends ChangeNotifier {

  List<Category> category = [];

  Future<List<Category>> getCategories() async => await DatabaseHelper.instance.getAllCategory();


  Future getCategorie() async { 
    category = await DatabaseHelper.instance.getAllCategory();
    notifyListeners();
  }

  getNotes (int categoryId) {
    return NoteModel().getNotes(categoryId);
  }

}

class Category {
  int id;
  String name;
  List<Note> notes;

  Category({this.id, @required this.name, @required this.notes});

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory Category.fromMap(Map<String, dynamic> json) => new Category(
      id: json["id"],
      name: json["name"],
      notes: [Note(id: 1, categoryId: 1, content: "content", title: "title")].toList()
      // notes: DatabaseHelper.getNotes(json["id"]) as List<Note>

      );
}
