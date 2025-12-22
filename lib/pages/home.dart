import 'package:flutter/material.dart';
import 'package:todolist/Components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todolist = [
    ["Web dev Project", false],
    ["Mobile app project", false],
    ["Machine learning", false],
    ["System Analysing", false],
    ["DevOps", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }
  void createNewTeask (){
    showDialog(context: context, builder: context){
      return AlertDialog()
    }
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTeask,
          child:Icon(Icons.add)
        
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: todolist[index][0],
            taskCompleted: todolist[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
