import 'package:flutter/material.dart';
import 'package:note_x/util/margin.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const YMargin(20),
          Container(
            height: 3,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(2)),
          ),
          const YMargin(5),
          Container(
            height: 3,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(2)),
          ),
          const YMargin(5),
          Container(
            height: 3,
            width: 15,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(2)),
          ),
        ],
      ),
    );
  }
}