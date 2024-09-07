import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as devtool show log;

class NetworkApi {
  static const accessToken =
      '4af3e1e7491ec8bb66f4a36407ca46a00421c55aeb8c05e1cb347c5c1da5751b';

  void registerUser({
    required String username,
    required String email,
    required String gender,
  }) async {
    const url = "https://gorest.co.in/public/v2/users";
    // const url = "https://reqres.in/api/users";

    final body = {
      'username': username,
      'email': email,
      'gender': gender,
    };

    try {
      final Response response = await http.post(
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer 4af3e1e7491ec8bb66f4a36407ca46a00421c55aeb8c05e1cb347c5c1da5751b',
        },
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
