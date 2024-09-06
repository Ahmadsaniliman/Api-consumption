import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as devtool show log;

class NetworkApi {
  void registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    const url = "https://reqres.in/api/users";

    final body = {
      'username': username,
      'email': email,
      'password': password,
    };

    try {
      final Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final resp = json.decode(response.body);
        devtool.log(resp.toString());
      } else {
        final resp = json.decode(response.body);
        devtool.log(resp.toString());
      }
    } catch (e) {
      //   devtool.log(e.toString());
    }
  }

  void loginUser({
    required String email,
    required String password,
  }) async {
    const url = "https://reqres.in/api/users";

    final body = {
      'email': email,
      'password': password,
    };

    try {
      final Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final resp = json.decode(response.body);
        devtool.log(resp.toString());
      } else {
        final resp = json.decode(response.body);
        devtool.log(resp.toString());
      }
    } catch (e) {
      devtool.log(e.toString());
    }
  }
}
