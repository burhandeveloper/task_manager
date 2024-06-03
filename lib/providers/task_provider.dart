import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks; // Getter to access the private _tasks list

  void addTask(String taskName) {
    final task = Task(name: taskName); // Creates a new Task instance
    _tasks.add(task); // Adds the new task to the list
    notifyListeners(); // Notifies listeners to rebuild the widgets
  }

  void toggleTaskStatus(Task task) {
    task.toggleDone(); // Toggles the task's completion status
    notifyListeners(); // Notifies listeners to rebuild the widgets
  }

  void clearTasks() {
    _tasks.clear(); // Clears the task list
    notifyListeners(); // Notifies listeners to rebuild the widgets
  }
}
