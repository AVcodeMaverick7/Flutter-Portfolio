import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_data.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;

  final Function checkboxCallback;

  final Function longPressedCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.longPressedCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.orange,
        value: isChecked, // checkBoxState
        onChanged: checkboxCallback,
      ),
      onLongPress: longPressedCallback,
    );
  }
}

// TaskCheckBox(
// checkBoxState: isChecked,
// toggleCheckboxState:
// }),

// (bool checkBoxState) {
// setState(() {
// isChecked = checkBoxState;
// });

// class TaskCheckBox extends StatelessWidget {
//   final bool checkBoxState;
//   final Function toggleCheckboxState;
//
//   TaskCheckBox({this.checkBoxState, this.toggleCheckboxState});
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.lightBlueAccent,
//       value: checkBoxState,
//       onChanged: toggleCheckboxState,
//     );
//   }
// }
