import 'dart:io';
import 'package:todo_app/todo.dart';
import 'package:todo_app/todo_repository.dart';
import 'package:ansicolor/ansicolor.dart';

final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen redPen = AnsiPen()..red();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yellowPen = AnsiPen()..yellow();

void main() {
  TodoRepository repo = TodoRepository();
  printMenu();
  while (true) {
    stdout.write("> ");
    String? input = stdin.readLineSync();
    if (input == null) {
      continue;
    }
    input = input.trim();
    if (input.isEmpty) {
      continue;
    }
    bool exit = handleCommand(repo, input);
    if (exit) {
      break;
    }
  }
}

bool handleCommand(TodoRepository repo, String input) {
  List<String> parts = input.split(" ");
  String command = parts[0].toLowerCase();
  try {
    switch (command) {
      case "add":
        addCommand(repo, input);
        break;
      case "list":
        listCommand(repo);
        break;
      case "done":
        doneCommand(repo, parts);
        break;
      case "delete":
        deleteCommand(repo, parts);
        break;
      case "exit":
        print(greenPen("exit"));
        break;
      default:
        print("unknown code");
        break;
    }
  } catch (e) {
    print(redPen("Eror: $e"));
  }
  return false;
}

void printMenu() {
  print(yellowPen('Приложение ТОДО'));
  print("Команды");
  print('add <text> - добавить задачу');
  print('list       - показать список');
  print('done<id>   - отметить выполненной');
  print('delete<id> - удалить задачу');
  print('exit       - выход');
  print('---------------------------------');
  print(' ');
}

void addCommand(TodoRepository repo, String input) {
  if (input.length <= 4) {
    print('Ошибка: введите текст');
    return;
  }
  String title = input.substring(4).trim();
  repo.add(title);
  print("Задача добавлена");
}

void listCommand(TodoRepository repo) {
  List<Todo> todos = repo.getAll();
  if (todos.isEmpty) {
    print("Список пуст");
    return;
  }
  for (var todo in todos) {
    print(todo);
  }
}

void doneCommand(TodoRepository repo, List<String> parts) {
  if (parts.length < 2) {
    print("Ошибка: укажите id");
    return;
  }
  int id = int.parse(parts[1]);
  repo.complete(id);
  print("task done");
}

void deleteCommand(TodoRepository repo, List<String> parts) {
  if (parts.length < 2) {
    print("Ошибка: укажите id");
    return;
  }
  int id = int.parse(parts[1]);
  repo.delete(id);
  print("task deleted");
}
