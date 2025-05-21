import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  bool isChecked;
  String title;
  TextDecoration textDecoration;
  Function(bool?) onChangedAction;

  TodoTile({
    required this.isChecked,
    required this.title,
    required this.onChangedAction,
    required this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
        color: Colors.amberAccent,
      ),
      child: Row(
        children: [
          Checkbox(value: isChecked, onChanged: onChangedAction),
          Expanded(child: Text(
            title,
            style: TextStyle(
              decoration: textDecoration,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),)
        ],
      ),
    );
  }
}
