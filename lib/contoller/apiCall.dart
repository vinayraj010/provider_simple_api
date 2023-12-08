import 'dart:convert';
import 'package:api_test/model/modeldata.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Todo> fetchTodo() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Todo.fromJson(data);
    } else {
      throw Exception('Failed to load todo');
    }
  }
}
