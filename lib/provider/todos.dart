import 'package:flutter/material.dart';
import '/model/todo.dart';
import '/utils.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Buy Food 😋',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => !todo.isDone).toList();

  List<Todo> get todosCompleted => _todos.where((todo) => todo.isDone).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(BuildContext context, Todo todo, {bool pop = false}) {
    _todos.remove(todo);
    notifyListeners();
    if (pop) Navigator.of(context).pop();
    Utils.showSnackBar(context, 'Deleted the task');
  }

  void toggleTodoStatus(BuildContext context, Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    Utils.showSnackBar(
      context,
      todo.isDone ? 'Task completed' : 'Task marked incomplete',
    );
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
