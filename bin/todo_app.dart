void main() {
  print("helloworlt");
  String name = "Artur";
  String? name2 = null;
  var count = 0;
  var title = "f";
  var x = 5;
  final id = 5;
  const appName = "tioduy";
  print("$name");
  List<String> tags = ['bycnb', 'ljv'];
  Map<String, dynamic> data = {'key': 'value', 'num': '10'};
  Set<int> numbers = {1, 2, 3};
  String greet(String name) => 'Hello $name';
  printTodo(title: "buy food");
  printTodo(title: "do homework", done: true);
}

void printTodo({required String title, bool done = false}) {
  print("${done ? '+' : '-'} $title");
}

class Todo {
  final int id;
  String title;
  bool isDone;

  Todo({required this.id, required this.title, this.isDone = false});
}
