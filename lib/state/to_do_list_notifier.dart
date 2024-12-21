import 'package:flutter/foundation.dart';
import 'package:to_do_app/models/to_do.dart';

class ToDoListNotifier extends ChangeNotifier {
  final List<ToDo> _toDoList = [];

  List<ToDo> get toDoList => _toDoList;

  String? _toDoTitleBuffer;

  void addToDo() {
    final toDo = ToDo(
      id: toDoList.length,
      label: _toDoTitleBuffer ?? 'New',
      dateCreated: DateTime.now(),
      isDone: false,
    );

    _toDoList.add(toDo);
    _toDoTitleBuffer = null;
    notifyListeners();
  }

  void setTitle(String title) => _toDoTitleBuffer = title;

  void removeToDo(ToDo toDo) {
    _toDoList.remove(toDo);
    notifyListeners();
  }

  void complete(int id) {
    toDoList[id].isDone = !toDoList[id].isDone;
    notifyListeners();
  }

  void clear() {
    _toDoList.clear();
    notifyListeners();
  }
}
