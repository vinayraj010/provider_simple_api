import 'package:api_test/model/modeldata.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  Todo? _todo;

  Todo? get todo => _todo;

  void setTodo(Todo todo) {
    _todo = todo;
    notifyListeners();
  }
}
