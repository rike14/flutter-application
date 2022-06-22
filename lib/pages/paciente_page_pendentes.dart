import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/pacientes_api.dart';

import 'package:flutter_application_1/models/paciente.dart';
import 'package:flutter_application_1/shared/scaffold.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPacientesPagePendentes extends StatefulWidget {
  const ListPacientesPagePendentes({Key? key}) : super(key: key);

  @override
  _ListPacientesPagePendentesState createState() =>
      _ListPacientesPagePendentesState();
}

class _ListPacientesPagePendentesState
    extends State<ListPacientesPagePendentes> {
  PacienteApi pacienteApi = PacienteApi();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(carregarPendentes());
  }

  Widget _bodyPendentes(List<Pacientes> pacientes) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: pacientes.length,
        itemBuilder: (BuildContext context, dynamic index) {
          return Container(
              margin: const EdgeInsets.all(8.0),
              child: _itemPendentes(pacientes[index]));
        },
      ),
    );
  }

  Widget _itemPendentes(Pacientes pacientes) {
    /* if (pacientes.id != "68") {
      return Row();
    }
    return pacientes.id != "68"
        ? Row()
        :*/
    // ignore: prefer_const_literals_to_create_immutables
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            leading: const Icon(
              Icons.person_pin,
              size: 50,
            ),
            title: Center(
              child: Text(
                'Nome do Paciente: ${pacientes.username}',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Container(
              margin: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  'Dia da Agenda: ${pacientes.id} ás ${pacientes.name} \nSala: ${pacientes.email}',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/consulta',
                arguments: {
                  'username': pacientes.username,
                  'id': pacientes.id,
                  'email': pacientes.email,
                  'name': pacientes.name
                },
              );
            }),
      ),
    ]);
  }

  Widget carregarPendentes() {
    return FutureBuilder<List<Pacientes>>(
      future: pacienteApi.postList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.hasData) {
          return _bodyPendentes(snapshot.data!);
        } else {
          return Center(
            child: LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2000,
              percent: 0.9,
              center: const Text(
                "Carregando...",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              barRadius: const Radius.circular(16),
              progressColor: Colors.deepPurpleAccent.shade200,
            ),
          );
        }
      },
    );
  }
}
