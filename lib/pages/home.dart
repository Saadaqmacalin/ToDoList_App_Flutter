import 'package:flutter/material.dart';
import 'package:todolist/Components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[300],
        elevation: 12,
        title: const Text("To-Do List"),
        centerTitle: true,
      ),
      body:  ListView(
        children: [
          ToDoTile(
            taskName: "todolist App",
            taskCompleted: true,
            onChanged: (p0){},
          ),
          ToDoTile(
            taskName: "todolist App",
            taskCompleted: true,
            onChanged: (p0){},
          ),ToDoTile(
            taskName: "todolist App",
            taskCompleted: false,
            onChanged: (p0){},
          )
        ],

      )
    );
  }
}