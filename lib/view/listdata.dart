import 'package:api_test/contoller/apiCall.dart';
import 'package:api_test/contoller/provider.dart';
import 'package:api_test/model/modeldata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoWidget extends StatefulWidget {
  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _fetchTodo();
  }

  _fetchTodo() async {
    Todo todo = await apiService.fetchTodo();
    Provider.of<TodoProvider>(context, listen: false).setTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    Todo? todo = Provider.of<TodoProvider>(context).todo;
    return Center(
      child: todo == null
          ? CircularProgressIndicator()
          : Text('Title: ${todo.title} \nCompleted: ${todo.completed}'),
    );
  }
}
