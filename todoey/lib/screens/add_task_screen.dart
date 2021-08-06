import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_data.dart';

class AddTaskScreen extends StatelessWidget {
  // final Function addTaskCallback;
  //
  // AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                //fontWeight: FontWeight.w400,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.orange, fontSize: 18.0),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            FlatButton(
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  Navigator.pop(context);
                  //addTaskCallback(newTaskTitle);
                },
                color: Colors.orange,
                height: 50.0,
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ))
          ],
        ),
      ),
    );
  }
}
