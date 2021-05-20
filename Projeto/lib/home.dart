import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Controller();

  _textField(
      {String labelText, onChanged, String Function() errorText, Key key}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: labelText,
          errorText: errorText == null ? null : errorText(),
          border: OutlineInputBorder()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("AgendaNet")),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: new SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) {
                    return _textField(
                      labelText:
                          "Nome Empresa", /*
                      onChanged: controller.client.changeName,
                      errorText: controller.validateName*/
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    return _textField(
                      labelText:
                          "CNPJ", /*
                      onChanged: controller.client.changeEmail,
                      errorText: controller.validateEmail*/
                    );
                  },
                ),
                SizedBox(height: 10),
                Container(
                  child: Observer(
                    //ddd
                    builder: (_) {
                      return _textField(
                        labelText:
                            "DDD", /*
                        onChanged: controller.client.changeEmail,
                        errorText: controller.validateEmail*/
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Observer(
                  //telefone
                  builder: (_) {
                    return _textField(
                      labelText:
                          "Telefone", /*
                      onChanged: controller.client.changeEmail,
                      errorText: controller.validateEmail*/
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  //cep
                  builder: (_) {
                    return _textField(
                      labelText: "CEP",
                      /*
                      onChanged: controller.client.changeEmail,
                      errorText: controller.validateEmail*/
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  //cidade
                  builder: (_) {
                    return _textField(
                      labelText: "Cidade",
                      /*
                      onChanged: controller.client.changeEmail,
                      errorText: controller.validateEmail*/
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  //usu login
                  builder: (_) {
                    return _textField(
                      labelText:
                          "Login", /*
                      onChanged: controller.client.changeEmail,
                      errorText: controller.validateEmail*/
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  //senha
                  builder: (_) {
                    return _textField(
                      labelText: "Senha",
                      /*
                      onChanged: controller.client.changeEmail,
                      errorText: controller.validateEmail*/
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(builder: (_) {
                  return ElevatedButton(
                    onPressed: () {},
                    child: Text("Cadastrar"),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
