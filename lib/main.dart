import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/consulta_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/paciente_page_pendentes.dart';
import 'package:flutter_application_1/pages/inicio_evolucao.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      title: 'Evolução',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoginPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/inicio', page: () => const InicioEvolucao()),
        GetPage(
            name: '/paciente', page: () => const ListPacientesPagePendentes()),
        GetPage(name: '/consulta', page: () => const ConsultaPage()),
      ],
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
