import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List toDoList = [];
  // reference the box
  final _myBox = Hive.box('mybox');

  // run this method if this is the first time ever opening this app
  void createInitialData(){
    toDoList = [
      ["Get Started", false]
    ];
  }

  // load data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the data in the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}

