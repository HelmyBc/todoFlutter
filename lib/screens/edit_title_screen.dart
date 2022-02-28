import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo/models/task.dart';
import 'package:todo/models/tasks_data.dart';

class EditTitleScreen extends StatefulWidget {
  final Task task;
  const EditTitleScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  _EditTitleScreenState createState() => _EditTitleScreenState();
}

class _EditTitleScreenState extends State<EditTitleScreen> {
  String taskTitle = "hedha raw test";

  @override
  Widget build(BuildContext context) {
    Task task = widget.task;
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            'Edit Task title',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
          ),
          TextField(
            autofocus: true,
            onChanged: (val) {
              taskTitle = val;
            },
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              if (taskTitle.isNotEmpty) {
                Provider.of<TasksData>(context, listen: false)
                    .updateTask(task, taskTitle);
                Navigator.pop(context);
              }
              print("btn clicked");
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.red),
          ),
        ],
      ),
    );
  }
}
