import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/pacientes_api.dart';
import 'package:flutter_application_1/models/alerta.dart';

import 'package:flutter_application_1/models/paciente.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ListPacientesPageConcluidos extends StatefulWidget {
  const ListPacientesPageConcluidos({Key? key}) : super(key: key);

  @override
  _ListPacientesPageConcluidosState createState() =>
      _ListPacientesPageConcluidosState();
}

class _ListPacientesPageConcluidosState
    extends State<ListPacientesPageConcluidos> {
  PacienteApi pacienteApi = PacienteApi();
  bool isClicked = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: carregarConcluidos(),
    );
  }

  Widget _bodyConcluidos(List<Pacientes> pacientes) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: pacientes.length,
        itemBuilder: (BuildContext context, dynamic index) {
          return Container(
              margin: const EdgeInsets.all(8.0),
              child: _itemConcluidos(pacientes[index]));
        },
      ),
    );
  }

  Widget _itemConcluidos(Pacientes pacientes) {
    /* return pacientes.id == "68"
        ? */
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
                  'Nome do Paciente: ${pacientes.id}',
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
                    'Dia da Agenda: ${pacientes.username} ás ${pacientes.name} \nSala: ${pacientes.email}',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              onTap: () {
                alertObservacao(
                  context,
                  '',
                );
              })),
    ]);
    // : Row();
  }

  Widget carregarConcluidos() {
    return FutureBuilder<List<Pacientes>>(
      future: pacienteApi.postList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.hasData) {
          return _bodyConcluidos(snapshot.data!);
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
