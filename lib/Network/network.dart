import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as devtool show log;
import 'package:jsonapiintergation/Model/model.dart';

class Network {
  Future<List<User>> getUsers() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    try {
      final Response response = await http.get(
        Uri.parse(
          Uri.encodeFull(url),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final items = (data as List)
            .map(
              (item) => User.fromMap(item),
            )
            .toList();
        return items;
      } else {
        throw Exception('something went wrong');
      }
    } catch (e) {
      devtool.log(e.toString());
      devtool.log('wrong');
      throw Exception('Something went wrong');
    }
  }

  Future<List<Todos>> getTodos() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    try {
      final Response response = await http.get(
        Uri.parse(
          Uri.encodeFull(url),
        ),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final items = (data as List)
            .map(
              (item) => Todos.fromMap(item),
            )
            .toList();
        return items;
      } else {
        throw Exception('something went wrong');
      }
    } catch (e) {
      devtool.log(e.toString());
      devtool.log('wrong');
      throw Exception('Something went wrong');
    }
  }

  Future<List<Photos>> getPhotos() async {
    const url = 'https://jsonplaceholder.typicode.com/photos';
    try {
      final Response response = await http.get(
        Uri.parse(
          Uri.encodeFull(url),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final items = (data as List)
            .map(
              (item) => Photos.fromMap(item),
            )
            .toList();
        return items;
      } else {
        throw Exception('something went wrong');
      }
    } catch (e) {
      devtool.log(e.toString());
      devtool.log('wrong');
      throw Exception('Something went wrong');
    }
  }
}
