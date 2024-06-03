import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Center(child: Text('Internee Task Manager',style: TextStyle(fontWeight: FontWeight.bold),)),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                newTaskTitle = value; // Updates newTaskTitle with the input value
              },
              decoration: InputDecoration(
                labelText: 'New Task',
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0), // Add padding here
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (newTaskTitle.isNotEmpty) {
                      Provider.of<TaskProvider>(context, listen: false).addTask(newTaskTitle); // Adds the new task
                    }
                  },
                  child: Text('Add Task'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<TaskProvider>(context, listen: false).clearTasks(); // Clears all tasks
                  },
                  child: Text('Clear Screen'),
                ),
              ],
            ),
            Expanded(
              child: TaskList(), // Displays the list of tasks
            ),
          ],
        ),
      ),
    );
  }
}
