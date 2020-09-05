import 'package:flutter/material.dart';
import 'package:note_x/models/category_model.dart';
import 'package:note_x/models/note_model.dart';
import 'package:note_x/screens/note_detail_page.dart';
import 'package:note_x/util/margin.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {

  final double percent;
  final Note note;
  final Category category;
  

  NoteCard({
    Key key,
    @required this.note,
    @required this.category,
    this.percent = 0.3,}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return Consumer<NoteModel>(builder: (context, model, widget) => InkWell(
      onTap: () async {
          int res = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteDetailPage(note: note, category: category,),
          ),
        );

        if(res == 1)Navigator.pop(context);
      },
      child: Container(
        height: screenHeight(context, percent: 0.4, ),
        width:  screenWidth(context, percent: 0.4, ),
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            new BoxShadow(
              offset: Offset(0, -1),
              spreadRadius: -13,
              color: Colors.lightBlue.withOpacity(0.9),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const YMargin(10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    note.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.blue),
                  ),
                  const YMargin(10),
                  Text(
                    note.content,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}