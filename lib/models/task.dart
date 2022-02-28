class Task {
  final int id;
  String title;
  bool done;

  Task({
    required this.id,
    required this.title,
    this.done = false,
  });

  factory Task.fromMap(Map taskMap) {
    return Task(
      id: taskMap['id'],
      title: taskMap['title'],
      done: taskMap['done'],
    );
  }
  void toggle() {
    done = !done;
  }

  void update(String t) {
    title = t;
  }
}
