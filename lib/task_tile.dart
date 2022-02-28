import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/tasks_data.dart';
import 'package:todo/screens/edit_title_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final TasksData tasksData;

  const TaskTile({Key? key, required this.task, required this.tasksData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          activeColor: Colors.green,
          value: task.done,
          onChanged: (checkbox) {
            tasksData.toggleTask(task);
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration:
                task.done ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Wrap(
          spacing: 12, // space between two icons
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return  EditTitleScreen(task: task);
                    });
              },
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                tasksData.deleteTask(task);
              },
            ), // icon-2
          ],
        ),
      ),
    );
  }
}
