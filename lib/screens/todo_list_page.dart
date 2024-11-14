import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> tasks = []; // hold list of tasks
  final TextEditingController taskController = TextEditingController(); // text field controller

  // function to add task
  void _addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(taskController.text);
        taskController.clear(); // clear textbox once task is added
      });
    }
  }

  // function to remove task
  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // top section for user to add task
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    "Add a Task to Your List",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      labelText: 'Type a task here...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8,),
                  ElevatedButton(
                      onPressed: _addTask,
                      child: Text("Add Task")
                  ),
                ],
              ),
            ),
            // Task List Display //
            SizedBox(height: 16,),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Task List",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                      child: ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: ListTile(
                                title: Text(tasks[index]),
                                trailing: IconButton(
                                    onPressed: () => _deleteTask(index),
                                    icon: Icon(Icons.delete, color: Colors.red,),
                                ),
                              ),
                            );
                          }
                      )
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}