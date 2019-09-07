import 'package:flutter/material.dart';
import 'package:flutter_course_todo/models/task_model.dart';
import 'package:flutter_course_todo/task.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TaskModel> _tasks;

  @override
  void initState() {
    super.initState();

    _tasks = [
      TaskModel(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear_all),
            onPressed: _clearCompleted,
            tooltip: "Limpar concluídos",
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _tasks
              .map(
                (task) => Task(
                  key: Key(task.id.toString()),
                  toggleComplete: () {
                    task.completed = !task.completed;

                    _updateTask(task);
                  },
                  onChangeDescription: (description) {
                    task.description = description;

                    _updateTask(task);
                  },
                  completed: task.completed,
                  description: task.description,
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTask,
      ),
    );
  }

  void _updateTask(TaskModel task) {
    setState(() {
      _tasks.map((oldTask) {
        if (oldTask.id == task.id) {
          return task;
        }

        return oldTask;
      });
    });
  }

  void _addTask() {
    if (_tasks.length == 0 || _tasks.last.description.isNotEmpty) {
      setState(() {
        _tasks.add(TaskModel());
      });
    }
  }

  void _clearCompleted() {
    setState(() {
      _tasks = _tasks.where((task) => !task.completed).toList();
    });
  }
}
