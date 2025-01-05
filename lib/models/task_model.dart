class Task {
  int? id;
  String title;
  String description;
  DateTime dueDate; // Keep as DateTime in memory
  bool isComplete;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isComplete = false,
  });

  // Convert to a Map (for SQLite or Hive)
  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        // Convert DateTime to String
        'dueDate': dueDate.toIso8601String(),
        'isComplete': isComplete ? 1 : 0, // Store bool as integer for SQLite
      };

  // Create a Task from a Map (retrieved from SQLite or Hive)
  static Task fromMap(Map<String, dynamic> map) => Task(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        // Parse String back to DateTime
        dueDate: DateTime.parse(map['dueDate']),
        isComplete: map['isComplete'] == 1, // Convert integer to bool
      );
}
