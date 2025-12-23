import 'package:flutter/material.dart';
import 'package:todolist/Components/dialog_box.dart';
import 'package:todolist/Components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

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
  void saveNewTask(){
    setState(() {
      if (_controller.text.trim().isEmpty) return;
      todolist.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  
  void deleteTask(int index){
    setState(() {
      todolist.removeAt(index);
    });
  }

 void createNewTask() {
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
        controller: _controller,
        save: saveNewTask,
        cancel: ()=>Navigator.of(context).pop(),
      ); // calls Dialogbox class
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[300],
        elevation:1,
        title: const Text("To-Do List"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
          child:Icon(Icons.add)
      ),

      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: todolist[index][0],
            taskCompleted: todolist[index][1],
            // onDelete: ()=>onDelete(index),
            deleteFunction: (context)=>deleteTask(index),
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
