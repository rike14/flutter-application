import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final TextEditingController _controller = TextEditingController();
TextEditingController _preTeste = TextEditingController();
TextEditingController _conduta = TextEditingController();
TextEditingController _posTeste = TextEditingController();

@override
void dispose() {
  _preTeste.dispose();
  _conduta.dispose();
  _posTeste.dispose();
  _controller.dispose();
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

@override
void initState() {
  _controller.addListener(() {
    final String text = _controller.text.toLowerCase();
    _controller.value = _controller.value.copyWith(
      text: text,
      selection:
          TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );
  });
  _preTeste.addListener(() {
    final String text = _controller.text.toLowerCase();
    _controller.value = _controller.value.copyWith(
      text: text,
      selection:
          TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );
  });
  _conduta.addListener(() {
    final String text = _controller.text.toLowerCase();
    _controller.value = _controller.value.copyWith(
      text: text,
      selection:
          TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );
  });
  _posTeste.addListener(() {
    final String text = _controller.text.toLowerCase();
    _controller.value = _controller.value.copyWith(
      text: text,
      selection:
          TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );
  });
}

alertLogin(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Login ou senha inválido"),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        );
      });
}

alertEvolucao(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Image.asset('lib/img/pontoexclamacao.png'),
          content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(children: [
                const Text(
                  'Tem certeza?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(msg),
                )
              ])),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade400),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side:
                                        const BorderSide(color: Colors.red)))),
                    child: const Text("   Sim   ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/paciente');
                    }),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade100),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side:
                                        const BorderSide(color: Colors.red)))),
                    child: const Text("     Cancelar     ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.red)),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ],
        );
      });
}

alertObservacao(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Observação:"),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 5,
              controller: _controller,
              autocorrect: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.deepPurpleAccent.shade200,
                  )),
                  labelStyle: const TextStyle(fontSize: 30),
                  suffixStyle: const TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
          actions: <Widget>[
            const Center(
                child: Text(
              'Tem certeza?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade400),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side:
                                        const BorderSide(color: Colors.red)))),
                    child: const Text("   Sim   ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.white)),
                    onPressed: () {
                      initState();

                      Navigator.pushNamed(context, '/paciente');
                    }),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade100),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side:
                                        const BorderSide(color: Colors.red)))),
                    child: const Text("     Cancelar     ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.red)),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ],
        );
      });
}
