import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/database_services.dart';

class TasksData extends ChangeNotifier {
  List<Task> tasks = [];

  Task getTaskById(int id) {
    for (Task t in tasks) {
      if (t.id == id) {
        return t;
      }
    }
    notifyListeners();
    return null as Task;
  }

  void addTask(String taskTitle) async {
    Task task = await DatabaseServices.addTask(taskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.toggle();
    DatabaseServices.toggleTask(task.id);
    notifyListeners();
  }

  void updateTask(Task task, String t) {
    task.update(t);
    DatabaseServices.updateTask(task, t);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    DatabaseServices.deleteTask(task.id);
    notifyListeners();
  }
}
