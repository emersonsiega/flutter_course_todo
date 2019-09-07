import 'package:flutter/material.dart';
import 'package:flutter_course_todo/task.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear_all),
            onPressed: () {
              // TODO: Limpar todos os completos
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Task(
              toggleComplete: () {
                
              },
              completed: true,
              description: "Comprar pão!",
            ),
            Task(
              toggleComplete: () {},
              completed: false,
              description: "",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: Adicionar nova task
        },
      ),
    );
  }
}
