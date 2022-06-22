import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/login.dart';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<Usuario> login(String userId, String id) async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');

    var params = <String, dynamic>{};
    params['userId'] = userId;
    params['id'] = id;

    http.Response response = await http.post(url, body: params);

    // ignore: prefer_typing_uninitialized_variables, unused_local_variable, avoid_init_to_null
    var decodedData = null;
    // if (response.statusCode == 200)

    String data = response.body;
    decodedData = jsonDecode(data);

    Map mapResponse = json.decode(response.body);
    var _userId = mapResponse['userId'];
    var _id = mapResponse['id'];

    // if (_id == 201) {
    //   true;
    // } else {
    //   const AlertDialog();
    // }
    return Usuario(
      userId: _userId,
      id: _id,
    );
  }
}
