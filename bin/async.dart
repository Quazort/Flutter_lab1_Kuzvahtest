import 'dart:io';

Future<String> readuserInput() async {
  print('Enter something: ');
  return stdin.readLineSync() ?? '';
}

Future<List<String>> fetchTodos() async {
  await Future.delayed(Duration(seconds: 1));
  return ['Remote todo 1', 'remote todo 2'];
}
void main() async {
  final input = await readuserInput();
  print('you entered: $input');
  print('loading todos');
  final todos = await fetchTodos();
  todos.forEach(print);
}