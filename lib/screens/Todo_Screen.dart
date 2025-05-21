import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/utils/AlertDialogBox.dart';
import 'package:todo_application/utils/TodoTile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var myController = TextEditingController();

  void onListTileClicked(int index) {
    setState(() {
      todosList[index].isChecked = !todosList[index].isChecked;
    });
  }

  void onAddClickedAction() {
    setState(() {
      todosList.add(TodoTileItems(false, myController.text));
    });
    Navigator.of(context, rootNavigator: true).pop();
    myController.text="";
  }

  void onCancelClickedAction() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void showAlertDialogBox() {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialogBox(
            myController,
            () {
              onAddClickedAction();
            },
            () {
              onCancelClickedAction();
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Application"),
        backgroundColor: Colors.amberAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialogBox();
        },
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        padding:EdgeInsets.only(top: 30),
        itemCount: todosList.length,
        itemBuilder: (context, index) {
          return Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {
                    setState(() {
                      todosList.removeAt(index);
                    });
                    ;
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: TodoTile(
              textDecoration: todosList[index].isChecked ? TextDecoration.lineThrough : TextDecoration.none ,
              isChecked: todosList[index].isChecked,
              title: todosList[index].todoTitle,
              onChangedAction: (p0) {
                onListTileClicked(index);
              },
            ),
          );
        },
      ),
    );
  }
}

class TodoTileItems {
  bool isChecked = false;
  String todoTitle;

  TodoTileItems(this.isChecked, this.todoTitle);
}

List<TodoTileItems> todosList = [
  TodoTileItems(true, "Task 1"),
  TodoTileItems(true, "Task 2"),
  TodoTileItems(true, "Task 3"),
  TodoTileItems(false, "Task 4"),
  TodoTileItems(false, "Task 5"),
  TodoTileItems(true, "Task 6"),
  TodoTileItems(false, "Task 7"),
  TodoTileItems(true, "Task 8"),
];
