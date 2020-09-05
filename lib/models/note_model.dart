import 'package:flutter/foundation.dart';
import 'package:note_x/data/database_helper.dart';

class NoteModel extends ChangeNotifier {
  List<Note> notes = [];

  Future getNotes(categoryId) async {
        notes = await DatabaseHelper.instance.getNotes(categoryId);
        // print(notes.toString());
        notifyListeners();
  }

  // Future<Note> getNote(noteId) async {
  //   Note note = await DatabaseHelper.instance.getNoteById(noteId);

  //   // print(note.toString());
  //   return note;
  // }

  Future save(Note note) async {
    // print(note.toString());
    int id = await DatabaseHelper.instance.insertNote(note);
    if(id == 1){
      notifyListeners();
    }
  }

  // Future update(Note note) async {
  //   await DatabaseHelper.instance.updateNote(note);
  //   notifyListeners();
  // }

  Future delete(Note note) async {
     await DatabaseHelper.instance.deleteNote(note);
    notifyListeners();
  }
}

class Note {
  int id;
  int categoryId;
  String title;
  String content;

  Note({ this.id,
      @required this.categoryId,
      @required this.title,
      @required this.content});

  Map<String, dynamic> toMap() {
    return {
     'id' : id,
      'category_id': categoryId,
      'title': title,
      'content': content
    };
  }

  factory Note.fromMap(Map<String, dynamic> json) => Note(
      id: json["id"],
      categoryId: json["category_id"],
      title: json["title"],
      content: json["content"]);
}
