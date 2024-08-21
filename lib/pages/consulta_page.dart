import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/pacientes_api.dart';
import 'package:flutter_application_1/models/alerta.dart';
import 'package:flutter_application_1/models/paciente.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsultaPage extends StatefulWidget {
  const ConsultaPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ConsultaPageState createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaPage> {
  PacienteApi pacienteApi = PacienteApi();
  TextEditingController _preTeste = TextEditingController();
  TextEditingController _conduta = TextEditingController();
  TextEditingController _posTeste = TextEditingController();

  @override
  void dispose() {
    _preTeste.dispose();
    _conduta.dispose();
    _posTeste.dispose();
    super.dispose();
  }

  void saveSubmitScreenPrefs(
    String preTeste,
    String conduta,
    String posTeste,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("pre_teste", preTeste);
    prefs.setString("conduta", conduta);
    prefs.setString("pos_teste", posTeste);

  }

  void loadSubmitScreenPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _preTeste = TextEditingController(text: prefs.getString("pre_teste"));
    _conduta = TextEditingController(text: prefs.getString("pre_teste"));
    _posTeste = TextEditingController(text: prefs.getString("pre_teste"));
  }

  Widget _body(List<Pacientes> paciente) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: paciente.length,
        itemBuilder: (BuildContext context, dynamic index) {
          return Column(children: [_item(paciente[index])]);
        },
      ),
    );
  }

  Widget _item(Pacientes paciente) {
    return /*paciente.jaFezEvolucao == "S"
        ? Row()
        : */
        Column(children: [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(
              Icons.person_pin,
              size: 80,
            ),
            title: Center(
              child: Text(
                paciente.name,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Container(
              margin: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Dia da Agenda: ${paciente.id} ás ${paciente.username} \nSala: ${paciente.email}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          )),
      Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: TextField(
                controller: _preTeste,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 5,
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.deepPurpleAccent.shade200,
                    )),
                    labelText: 'Pre Teste:',
                    labelStyle: const TextStyle(fontSize: 30),
                    suffixStyle: const TextStyle(
                      color: Colors.black,
                    )),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: TextField(
                controller: _conduta,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 5,
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.deepPurpleAccent.shade200,
                    )),
                    labelText: 'Conduta:',
                    labelStyle: const TextStyle(fontSize: 30),
                    suffixStyle: const TextStyle(
                      color: Colors.black,
                    )),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: TextField(
                controller: _posTeste,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 5,
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent.shade200)),
                    labelText: 'Pos Teste:',
                    labelStyle: const TextStyle(fontSize: 30),
                    suffixStyle: const TextStyle(
                      color: Colors.black,
                    )),
              ),
            ),
            Center(
                child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent.shade200,
                            fixedSize: const Size(200, 40)),
                        onPressed: () {
                          alertEvolucao(context,
                              'Você não poderá reverter isso! Ao confirmar irá salvar no prontuário do paciente.');
                        },
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                              backgroundColor: Colors.deepPurpleAccent.shade200,
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ))
          ]))
    ]);
  }

  Widget carregar() {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return FutureBuilder<List<Pacientes>>(
      future: pacienteApi.postITEMFiltrado(arguments['id']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done ||
            snapshot.hasData) {
          return _body(snapshot.data!);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade200,
        title: const Text(
          'Evolução',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(color: Colors.white, child: carregar()),
      persistentFooterButtons: [
        SizedBox(
          width: 900,
          child: Text(
            'Copyright ©$datetime, All Rights Reserved.',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        const SizedBox(
          width: 900,
          child: Text(
            'Henrique Kronhardt',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        )
      ],
    );
  }
}

String datetime = DateTime.now().year.toString();
