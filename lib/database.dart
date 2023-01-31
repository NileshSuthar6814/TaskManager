import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todolist = [];
  // ignore: non_constant_identifier_names
  final _DataBox = Hive.box('DataBox');

  void createInitialData() {
    todolist = [
      ["How are You", false],
      ["this is open source", false],
    ];
    //update data
  }

  void updateDataBase() {
    _DataBox.put("TODOLIST", todolist);
  }
  //from data base

  void loadData() {
    todolist = _DataBox.get("TODOLIST");
  }
}
