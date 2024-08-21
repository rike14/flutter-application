import 'dart:convert';

import 'package:flutter_application_1/api/base_api.dart';
import 'package:flutter_application_1/models/paciente.dart';
import 'package:http/http.dart' as http;

class PacienteApi extends BaseApi {
  Future<List<Pacientes>> postList() async {
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    });

    // List<Map<String, dynamic>> r = jsonDecode(response.body);
    List<dynamic> r = jsonDecode(response.body);
    List<Pacientes> pacientes = [];
    for (var element in r) {
      pacientes.add(Pacientes.fromMap(element));
    }
    return pacientes;
  }

  Future<List<Pacientes>> postITEMFiltrado(id) async {
    var urlsss = Uri.parse(
        'https://jsonplaceholder.typicode.com/users/$id');

    var response = await http.get(urlsss, headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    });
    var data = json.decode(response.body);
//    List<Map<String, dynamic>> rs = jsonDecode(response.body);

    Pacientes ssss = Pacientes(
        username: data['username'],
        id: data['id'],
        email: data['email'],
        name: data['name']);

    List<Pacientes> pacientes = [];
    pacientes.add(ssss);

    return pacientes;
  }

  Future<Pacientes> putList(String descrip) async {
    var jso = jsonEncode({'description': descrip});
    var response = await http.put(url, body: jso);
    Pacientes paciente = Pacientes.fromJson(response.body);
    return paciente;
  }
}
