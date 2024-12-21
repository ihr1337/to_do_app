class ToDo {
  final int id;
  final String label;
  final DateTime dateCreated;
  bool isDone;

  ToDo({
    required this.id,
    required this.label,
    required this.dateCreated,
    this.isDone = false,
  });
}
