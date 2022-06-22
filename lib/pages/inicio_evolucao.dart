import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class InicioEvolucao extends StatefulWidget {
  const InicioEvolucao({Key? key}) : super(key: key);

  @override
  State<InicioEvolucao> createState() => _InicioEvolucaoState();
}

class _InicioEvolucaoState extends State<InicioEvolucao> {
  late SharedPreferences logindata;
  String? userId;
  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      userId = logindata.getString('login').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent.shade200,
            title: Text('Olá $userId !!!',
                style: const TextStyle(fontStyle: FontStyle.normal)),
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
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 40,
                          fontStyle: FontStyle.normal),
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
          ), // now body page
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.shade200,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular((25.0))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent.shade200,
                      fixedSize: const Size(800, 800),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/paciente');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'lib/img/arrow-right1.png',
                          width: 50,
                        ),
                      ),
                      const Text(
                        'Evolução',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 40,
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                )),
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
        ));
  }
}

String datetime = DateTime.now().year.toString();
