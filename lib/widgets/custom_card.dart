import 'package:flutter/material.dart';
import 'package:note_x/models/category_model.dart';
import 'package:note_x/models/note_model.dart';
import 'package:note_x/screens/category_detail_page.dart';
import 'package:note_x/util/margin.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final double percent;
  final Category category; 
  

  const CustomCard({
    Key key,
    @required this.title,
    @required this.category,
    this.percent = 0.3,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteModel>(builder: (context, model, widget) => InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailPage(
//              image: image,
//              tasks: tasks,
//              title: title,
              category: category,
            ),
          ),
        );
      },
      child: Container(
        height: screenWidth(context, percent: percent),
        width: screenWidth(context, percent: percent),
        margin: EdgeInsets.all(9),
        padding: const EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            new BoxShadow(
              offset: Offset(0, -1),
              spreadRadius: -15,
              color: Colors.blue.withOpacity(0.8),
              blurRadius: 21,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const YMargin(20),
            Container(
              width: 50,
              height: 50,
//                child: Image.asset('assets/images/$image.png')
              child: Icon(
                Icons.work,
                size: 40.0,
                color: Colors.blue[900],

              ),
            ),
            const YMargin(15),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title ?? '',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500, color: Colors.blue),
                  ),
                  const YMargin(5),
                  Text(
                    '${category.notes.length} Task${category.notes.length == 0 || category.notes.length < 2 ? '' : 's'}',
                    style: TextStyle(
                        fontSize: 16,
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