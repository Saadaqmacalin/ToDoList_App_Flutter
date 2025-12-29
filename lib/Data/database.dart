import 'package:hive_flutter/adapters.dart';

class ToDoDatabase {
  List toDoList = [];
  final _mybox = Hive.box("mybox");

  void createInitialData (){
    toDoList=[
      ["implemetting House Rentall project",false],
      ["learning flutter",false]
    ];
  }
   
  void loadData(){
    toDoList=_mybox.get("TODOLIST");
  }
  void updateDatabase(){
    _mybox.put("TODOLIST",toDoList);
  }
}