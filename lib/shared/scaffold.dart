import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/pacientes_api.dart';
import 'package:flutter_application_1/pages/paciente_page_concluidos.dart';

// ignore: must_be_immutable
class ScaffoldDefault extends StatefulWidget {
  PacienteApi pacienteApi = PacienteApi();
  final Widget child;
  final Color? backGroundColor;
  final bool? loading;
  final String? titulo;
  ScaffoldDefault(this.child,
      {Key? key, this.loading, this.backGroundColor, this.titulo})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScaffoldDefaultState createState() => _ScaffoldDefaultState();
}

class _ScaffoldDefaultState extends State<ScaffoldDefault> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
              bottom: TabBar(
                labelStyle: const TextStyle(
                    letterSpacing: 2, fontWeight: FontWeight.bold),
                indicatorWeight: 5,
                indicatorColor: Colors.deepPurpleAccent.shade200,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Tab(
                      text: 'Pendentes',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Tab(
                      iconMargin: EdgeInsets.all(40),
                      text: 'Evoluídos',
                    ),
                  )
                ],
              ),
              backgroundColor:
                  widget.backGroundColor ?? Colors.deepPurpleAccent.shade200,
              title: const Text('V4V ',
                  style: TextStyle(fontStyle: FontStyle.italic)),
              centerTitle: true,
            ),
            endDrawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.shade200,
                      image: const DecorationImage(
                          fit: BoxFit.none,
                          image: AssetImage('lib/img/arrow-right1.png')),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: const Text(
                        'Evolução',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ListTile(
                      leading: const Icon(Icons.home, color: Colors.black),
                      title: const Text('Home'),
                      onTap: () => {Navigator.pushNamed(context, '/inicio')}),
                  ListTile(
                      leading: const Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                      title: const Text('Evolução'),
                      onTap: () => {Navigator.pushNamed(context, '/paciente')}),
                  ListTile(
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: const Text('Sair'),
                      onTap: () => {Navigator.pushNamed(context, '/login')}),
                ],
              ),
            ),
            body: TabBarView(
              children: [widget.child, const ListPacientesPageConcluidos()],
            ),
            persistentFooterButtons: [
              SizedBox(
                width: 900,
                child: Text(
                  'Copyright ©$datetime, All Rights Reserved.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Color.fromRGBO(121, 134, 203, 1)),
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
                    color: Color.fromRGBO(121, 134, 203, 1),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

String datetime = DateTime.now().year.toString();
