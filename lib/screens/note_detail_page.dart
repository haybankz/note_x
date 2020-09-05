import 'package:flutter/material.dart';
import 'package:note_x/models/category_model.dart';
import 'package:note_x/models/note_model.dart';
import 'package:note_x/screens/new_note_page.dart';
import 'package:note_x/util/margin.dart';
import 'package:provider/provider.dart';

class NoteDetailPage extends StatelessWidget {
  final Note note;
  final Category category;

  NoteDetailPage({@required this.note, this.category});

  @override
  Widget build(BuildContext context) {
    var noteModel = Provider.of<NoteModel>(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Material(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            actions: <Widget>[
              // XMargin(30),
              IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  size: 32,
                  color: Colors.white,
                ),
                onPressed: () async {
                  // noteModel.delete(note);
                  // Navigator.pop(context);
                  // bool res = showDeleteAlertDialog(context, noteModel, note);
                  bool res = await _asyncConfirmDeleteDialog(context, noteModel, note);
                  if (res) Navigator.pop(context, 1);
                },
              ),
              XMargin(20),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 32,
                  color: Colors.white,
                ),
                onPressed: () async {
                  int res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewNotePage(
                        note: note,
                        category: category,
                      ),
                    ),
                  );

                  if(res == 1){
                    Navigator.pop(context, 0);
                  }
                },
              ),
              XMargin(20),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Text(
                    note.title ?? "",
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // YMargin(10.0),
                Divider(
                  color: Colors.black,
                  height: 36.0,
                  endIndent: 40,
                  indent: 40,
                  thickness: 1.2,
                ),
                Flexible(
                  child: Text(
                    note.content ?? "",
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

// showDeleteAlertDialog(BuildContext context, NoteModel model, Note note) {
//   // set up the button
//   Widget yesButton = FlatButton(
//     child: Text(
//       "Yes",
//       style: TextStyle(color: Colors.red),
//     ),
//     onPressed: () {
//       model.delete(note);
//       Navigator.pop(context);

//       return true;
//     },
//   );

//   Widget noButton = FlatButton(
//     child: Text("No"),
//     onPressed: () {
//       Navigator.pop(context);
//       return false;
//     },
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("Delete"),
//     content: Text("Are you sure you want to delete the note?"),
//     actions: [
//       noButton,
//       yesButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

Future<bool> _asyncConfirmDeleteDialog(
    BuildContext context, NoteModel noteModel, Note note) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Note?'),
        content: const Text('Do you want to delete this note?'),
        actions: <Widget>[
          FlatButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          FlatButton(
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              noteModel.delete(note);
              Navigator.of(context).pop(true);
            },
          )
        ],
      );
    },
  );
}
