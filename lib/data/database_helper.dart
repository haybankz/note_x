import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:note_x/models/note_model.dart';
import 'package:note_x/models/category_model.dart';

class DatabaseHelper {
  static final _databaseName = 'note_x_db.db';
  static final _databaseVersion = 1;

  static final _tableNote = 'notes';
  static final _tableCategory = 'category';

  static final note_columnId = 'id';
  static final note_columnCategoryId = 'category_id';
  static final note_columnTitle = 'title';
  static final note_columnContent = 'content';

  static final category_columnId = 'id';
  static final category_columnName = 'name';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();

    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
//    print('Create dbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
    await db.execute('''
    Create table $_tableNote (
        $note_columnId integer primary key autoincrement, 
        $note_columnCategoryId integer not null, 
        $note_columnTitle text not null,
        $note_columnContent text not null
      )  
    ''');

    await db.execute('''
    Create table $_tableCategory (
        $category_columnId integer primary key autoincrement, 
        $category_columnName text not null
      )  
    ''');

    var model = Category( name: "Family", notes: []).toMap();
    await db.insert(_tableCategory, model);
    model = Category( name: "Quotes", notes: []).toMap();
    await db.insert(_tableCategory, model);
    model = Category(name: "Study", notes: []).toMap();
    await db.insert(_tableCategory, model);
    model = Category( name: "Work", notes: []).toMap();
    await db.insert(_tableCategory, model);
    model = Category( name: "Others", notes: []).toMap();
    await db.insert(_tableCategory, model);

    // model = Note(
    //         id: 1,
    //         categoryId: 1,
    //         content:
    //             "test_content_family test the mother effing thing yo!. i have got a lot of plans for the year 2020, i'll try to accomplish them, so help me god",
    //         title: 'test_title_family')
    //     .toMap();
    // await db.insert(_tableNote, model);
    // model = Note(
    //         id: 1,
    //         categoryId: 1,
    //         content: "test_content_family2",
    //         title:
    //             'test_title_family2 lets see how long this statement or sentences would get, you dig me')
    //     .toMap();
    // await db.insert(_tableNote, model);
    // model = Note(
    //         id: 1,
    //         categoryId: 2,
    //         content:
    //             "test_content_Quote try me out arnold schwazzenegger, i am tired of typing, i might fuck around and come up with a lorem ipsum kinda library for stuff like this",
    //         title: 'test_title_Quote')
    //     .toMap();
    // await db.insert(_tableNote, model);
    // model = Note(
    //         id: 1,
    //         categoryId: 3,
    //         content:
    //             "test_content_2 i am a tesimony pelzin, i probably need to rest now, i need someone to save me from my self",
    //         title:
    //             'Project reminder, remind me to ask for waec zonal, branch and satellite offices address and contact info from raji or alhaji')
    //     .toMap();
    // await db.insert(_tableNote, model);
    // model = Note(
    //         id: 1,
    //         categoryId: 3,
    //         content: "test_content_2 flutter starter pack",
    //         title:
    //             'test_title_Study2, i think i\'m getting better with this typing thing and my productivity level increased as soon as starte working with a macbook')
    //     .toMap();
    // await db.insert(_tableNote, model);
    
    // model = Note(
    //         id: 1,
    //         categoryId: 4,
    //         content:
    //             "test_content_2 trying to make this guy look as many as possible, you feel me? this almost made it to the 4th line, you dig",
    //         title: 'test_title_Work')
    //     .toMap();
    // await db.insert(_tableNote, model);
  }

  Future<int> insertNote(Note note) async {
//    sleep(const Duration(seconds:10));
    Database db = await instance.database;
    return await db.insert(_tableNote, note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertCategory(Category category) async {
//    sleep(const Duration(seconds:10));
    Database db = await instance.database;
    return await db.insert(_tableNote, category.toMap());
  }

  Future<List<Category>> getAllCategory() async {
    Database db = await instance.database;
//    sleep(const Duration(seconds:6));
    var res = await db.query(_tableCategory);
    List<Category> categories = res.map((c) => Category.fromMap(c)).toList();

    List<Category> cat = new List();

    getAllNotes();

    //  categories.map((f) => f.notes =  (getNotes(f.id) as List<Note>));
    for (var item in categories) {
      // cat.add(Category(id: item.id, name: item.name, notes: getNotes(item.id)));
      var res = await db.query(_tableNote,
          where: '$note_columnCategoryId = ?', whereArgs: [item.id]);
      List<Note> notes = res.map((c) => Note.fromMap(c)).toList();
      cat.add(Category(id: item.id, name: item.name, notes: notes));
    }

    return cat;
  }

  Future<List<Note>> getAllNotes() async {
    Database db = await instance.database;
    var res = await db.query(_tableNote);
    List<Note> notes = res.map((c) => Note.fromMap(c)).toList();
    return notes;
  }

  Future<List<Note>> getNotes(int categoryId) async {
    Database db = await instance.database;
    var res = await db.query(_tableNote,
        where: '$note_columnCategoryId = ?', whereArgs: [categoryId]);
    List<Note> notes = res
        .map((c) => Note.fromMap(c))
        .where((f) => f.categoryId == categoryId)
        .toList();
    return notes;
  }

  Future<int> updateNote(Note note) async {
    Database db = await instance.database;
    return db.update(_tableNote, note.toMap(), where: '$note_columnId = ?', whereArgs: [note.id]);
  }

Future<int> deleteNote(Note note) async {
  Database db = await instance.database;
  return db.delete(_tableNote, where: "$note_columnId = ?", whereArgs: [note.id]);
}

Future<Note> getNoteById(int id) async {
  Database db = await instance.database;
    var res = await db.query(_tableNote);
    List<Note> notes = res.map((c) => Note.fromMap(c)).toList();
    return notes[0];
}

  // setToDone(Todo todo) async{
  //   todo.isDone = 1;
  //   Database db = await instance.database;
  //   await db.update(_table, todo.toMap(), where: "id = ?", whereArgs: [todo.id]);

  // }

  // deleteTodo(Todo todo) async{
  //   Database db = await instance.database;
  //   db.delete(_table, where: "id = ?", whereArgs: [todo.id]);
  // }

}
