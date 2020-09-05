import 'package:flutter/material.dart';

class NoNotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.note, size: 96.0, color: Colors.black38,),
          Text(
          "No note available",
          style: TextStyle(
            color: Colors.black38,
            fontSize: 24.0,
          ),
        ),
      
        ],
         ),
    );
  }
}
