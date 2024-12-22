import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/models/to_do.dart';

class ToDoListNotifier extends ChangeNotifier {
  static const String _hiveBox = 'todos';

  final List<ToDo> _toDoList = [];

  List<ToDo> get toDoList => _toDoList;

  String? _toDoTitleBuffer;

  Future<void> init() async {
    await _openHiveBox();
    await _extractLocalTodos();

    notifyListeners();
  }

  void addToDo() {
    final toDo = ToDo(
      id: toDoList.length,
      label: _toDoTitleBuffer ?? 'New',
      dateCreated: DateTime.now(),
      isDone: false,
    );

    _toDoList.add(toDo);
    _toDoTitleBuffer = null;

    Hive.box(_hiveBox).put(
      toDo.id.toString(),
      toDo.toJson(),
    );
    notifyListeners();
  }

  void setTitle(String title) => _toDoTitleBuffer = title;

  void removeToDo(ToDo toDo) {
    _toDoList.remove(toDo);
    Hive.box(_hiveBox).delete(toDo.id.toString());
    notifyListeners();
  }

  void complete(int id) {
    toDoList[id].isDone = !toDoList[id].isDone;
    _updateToDo(toDoList[id]);
    notifyListeners();
  }

  void clear() {
    _toDoList.clear();
    Hive.box(_hiveBox).clear();
    notifyListeners();
  }

  void _updateToDo(ToDo toDo) {
    Hive.box(_hiveBox).put(
      toDo.id.toString(),
      toDo.toJson(),
    );
    notifyListeners();
  }

  Future<void> _openHiveBox() async {
    if (Hive.isBoxOpen(_hiveBox)) return;

    await Hive.openBox(_hiveBox);
  }

  Future<void> _extractLocalTodos() async {
    final box = Hive.box(_hiveBox);
    final toDoList = box.toMap().entries.map((e) {
      return ToDo.fromJson(e.value);
    }).toList();

    _toDoList.addAll(toDoList);
  }
}
