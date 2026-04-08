class Todo {
  String title;
  bool isDone;
  static int _counter = 0;
  final int id;

  Todo(this.title) : id = ++_counter, isDone = false;

  @override
  String toString() {
    String status;
    if (isDone) {
      status = "[x]";
    } else {
      status = " ";
    }
    return '$status $id $title';
  }
}
