import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogBox extends StatelessWidget {
  TextEditingController myController;
  Function() add;
  Function() cancel;

  AlertDialogBox(this.myController, this.add, this.cancel);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amberAccent,
      title: Text(style: TextStyle(fontSize: 18), "Add new Todo"),
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new todo...",
              ),
              controller: myController,
            ),
            Expanded(child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: cancel, child: Text("Cancel")),
                TextButton(onPressed: add, child: Text("Add")),
              ],
            ),)

          ],
        ),
      ),
    );
  }
}
