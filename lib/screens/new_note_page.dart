import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_x/models/category_model.dart';
import 'package:note_x/models/note_model.dart';
import 'package:note_x/util/margin.dart';
import 'package:provider/provider.dart';

class NewNotePage extends StatefulWidget {
  final Category category;
  final Note note;

  NewNotePage({@required this.category, this.note});

  @override
  _NewNotePageState createState() => _NewNotePageState(category, note);
}

class _NewNotePageState extends State<NewNotePage> {
  Category category;
  Note note;

  TextEditingController controllerTitle;

  TextEditingController controllerContent;

  _NewNotePageState(this.category, this.note);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerContent.dispose();
    controllerTitle.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controllerTitle =
        TextEditingController(text: note != null ? note.title : '');
    controllerContent =
        TextEditingController(text: note != null ? note.content : '');
  }

  @required
  Widget build(BuildContext context) {
    // print('object: $note');

    var noteModel = Provider.of<NoteModel>(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text(category.name),
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(
            //       Icons.save,
            //       size: 32,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {},
            //   ),
            //   XMargin(20),
            // ],
          ),
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
//            margin: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                YMargin(10),
                TextField(
                  maxLines: 3,
                  minLines: 1,
                  controller: controllerTitle,
                  // onChanged: (text){
                  //   controllerTitle.text = text;
                  // },
                  decoration: InputDecoration(
                    hintText: "Enter your title here",
                    border: OutlineInputBorder(),
                    labelText: "Title",
                    alignLabelWithHint: true,
                  ),
                ),
                YMargin(20),
                TextField(
                  maxLines: Platform.isAndroid ? 12 : 18,
                  minLines: Platform.isAndroid ? 10 : 15,
                  controller: controllerContent,
                  // onChanged: (text){
                  //   controllerContent.text = text;
                  // },
                  decoration: InputDecoration(
                    hintText: "Enter your note here",
                    border: OutlineInputBorder(),
                    labelText: "note",
                    alignLabelWithHint: true,
                  ),
                  maxLengthEnforced: true,
                  maxLength: 99999999999999999,
                  buildCounter: (_, {currentLength, maxLength, isFocused}) =>
                      currentLength == 0 && !isFocused
                          ? null
                          : Text('$currentLength'),
                ),
                YMargin(14),
                SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () {
                      // if(note == null){
                      var notess = Note(
                          categoryId: category.id,
                          title: controllerTitle.text,
                          content: controllerContent.text);
                      if (note != null) notess.id = note.id;
                      noteModel.save(notess);
                      Navigator.pop(context, 1);
                      // }else{
                      //   final notess = Note(
                      //     categoryId: category.id,
                      //     title: controllerTitle.text,
                      //     content: controllerContent.text,
                      //     id: note.id);
                      // noteModel.save(notess);
                      // Navigator.pop(context, 1);
                      // }
                    },
                    color: Colors.blue,
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  TextField(
//           maxLines: null,
//           keyboardType: TextInputType.multiline,
//         ),
