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

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'dateCreated': dateCreated.toIso8601String(),
        'isDone': isDone,
      };

  factory ToDo.fromJson(Map<dynamic, dynamic> json) {
    return ToDo(
      id: json['id'],
      label: json['label'],
      dateCreated: DateTime.parse(json['dateCreated']),
      isDone: json['isDone'],
    );
  }
}
