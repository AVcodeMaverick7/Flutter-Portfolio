import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_data.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/tasks_screen.dart';

class TasksList extends StatelessWidget {
  // final List<Task> tasks;
  // TasksList(this.tasks);

//   @override
//   _TasksListState createState() => _TasksListState();
// }
//
// class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                longPressedCallback: () {
                  taskData.deleteTask(task);
                },
                checkboxCallback: (checkBoxState) {
                  taskData.updateTask(task);
                });

            // setState(() {
            //   widget.tasks[index].toggleDone();
            // });
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}

//
// (
// children: [
// TaskTile(
// taskTitle: task[0].name,
// isChecked: task[0].isDone,
// ),
// TaskTile(
// taskTitle: task[1].name,
// isChecked: task[1].isDone,
// ),
// TaskTile(
// taskTitle: task[2].name,
// isChecked: task[2].isDone,
// ),
// ],
