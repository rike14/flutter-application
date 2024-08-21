import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/alerta.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const LoginApp());

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _login = TextEditingController();
  final _senha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late SharedPreferences logindata;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  // ignore: non_constant_identifier_names
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _login.dispose();
    _senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.indigo.shade100,
                        Colors.indigo.shade200,
                        Colors.indigo.shade300,
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(90))),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 25, right: 32),
                        child: Text(
                          'Entrar',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        padding: const EdgeInsets.all(25),
                        child: ListView(
                          children: <Widget>[
                            _textFormField(
                              "Login",
                              "Digite o Login",
                              controller: _login,
                              validator: (String? value) {
                                _validalogin('');
                                return null;
                              },
                            ),
                            _textFormField(
                              "Senha",
                              "Digite a Senha",
                              senha: true,
                              controller: _senha,
                              validator: (String? value) {
                                _validaSenha('');
                                return null;
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 50),
                              child: Column(children: [
                                _elevateButton1("Entrar",
                                    const Color.fromRGBO(2, 0, 36, 1), context),
                                /* _elevateButton2("Criar Conta",
                                  const Color.fromRGBO(2, 0, 36, 1), context),
                              _elevateButton3("Esqueceu a Senha?",
                                  const Color.fromRGBO(2, 0, 36, 1), context),*/
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
    );
  }

  _textFormField(
    String label,
    String hint, {
    bool senha = false,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: senha,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }

  String? _validalogin(String texto) {
    if (texto.isEmpty) {
      return "Digite o Login";
    }
    if (texto.length < 3) {
      return "O campo precisa ter mais de 3 caracteres";
    }
    return null;
  }

  // ignore: body_might_complete_normally_nullable
  String? _validaSenha(String texto) {
    if (texto.isEmpty) {
      return "Digite a Senha";
    }
  }

  _elevateButton1(String texto, Color cor, BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(115, 103, 240, 1)),
      ),
      onPressed: () {
        _clickButton(context);
      },
      child: Center(
        child: Text(
          'Entrar'.toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /*_elevateButton2(String texto, Color cor, BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(118, 1, 141, 0.8)),
      ),
      onPressed: () {
        _clickButton(context);
      },
      child: Center(
        child: Text(
          'Criar conta'.toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _elevateButton3(String texto, Color cor, BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(118, 1, 141, 0.5)),
      ),
      onPressed: () {
        _clickButton(context);
      },
      child: Center(
        child: Text(
          'Esqueceu a Senha?'.toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }*/

  _clickButton(BuildContext context) async {
    bool formOk = _formKey.currentState!.validate();

    logindata.setString('login', _login.text);

    if (!formOk) {
      return;
    }

    dynamic userId = _login.text;
    dynamic id = _senha.text;

    // print("login : $userId, senha : $id ");


    if (userId == '1' && id == '1') {
      // ignore: use_build_context_synchronously
      _navegaHomepage(context);
    } else {
      // ignore: use_build_context_synchronously
      alertLogin(context, 'Login ou senha inválido');
    }
  }

  _navegaHomepage(BuildContext context) {
    Navigator.pushNamed(context, '/inicio');
  }
}

String datetime = DateTime.now().year.toString();
