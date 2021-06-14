import 'package:flutter/material.dart';
import 'package:flutter_app_api/model/empresa_model.dart';
import 'package:flutter_app_api/ui/home_page.dart';

class EmpresaPage extends StatefulWidget {
  final Empresa emp;
  EmpresaPage({this.emp});

  @override
  _EmpresaPageState createState() => _EmpresaPageState();
}

class _EmpresaPageState extends State<EmpresaPage> {
  final _codEmpresa = TextEditingController();
  final _loginEmpresa = TextEditingController();
  final _senhaEmpresa = TextEditingController();
  final _nomeEmpresa = TextEditingController();
  final _cnpjEmpresa = TextEditingController();

  Empresa _editedEmp;

  @override
  void initState() {
    super.initState();

    if (widget.emp == null) {
      _editedEmp = Empresa();
    } else {
      _editedEmp = widget.emp;
    }
    _codEmpresa.text = _editedEmp.codEmpresa;
    _loginEmpresa.text = _editedEmp.loginEmpresa;
    _senhaEmpresa.text = _editedEmp.senhaEmpresa;
    _nomeEmpresa.text = _editedEmp.nomeEmpresa;
    _cnpjEmpresa.text = _editedEmp.cnpjEmpresa;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text('Cadastro de Empresa'),
          backgroundColor: Colors.green,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _codEmpresa,
              decoration: InputDecoration(labelText: "Codigo"),
              style: TextStyle(fontSize: 20),
              enabled: false,
              onChanged: (text) {
                _editedEmp.codEmpresa = text ?? "";
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _nomeEmpresa,
              decoration: InputDecoration(labelText: "Nome"),
              style: TextStyle(fontSize: 20),
              onChanged: (text) {
                setState(() {
                  _editedEmp.nomeEmpresa = text;
                });
              },
            ),
            TextField(
              controller: _cnpjEmpresa,
              decoration: InputDecoration(labelText: "CNPJ"),
              style: TextStyle(fontSize: 20),
              onChanged: (text) {
                _editedEmp.cnpjEmpresa = text;
              },
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _loginEmpresa,
              decoration: InputDecoration(labelText: "Login"),
              style: TextStyle(fontSize: 20),
              onChanged: (text) {
                _editedEmp.loginEmpresa = text;
              },
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _senhaEmpresa,
              decoration: InputDecoration(labelText: "Senha"),
              style: TextStyle(fontSize: 20),
              onChanged: (text) {
                _editedEmp.senhaEmpresa = text;
              },
              keyboardType: TextInputType.phone,
            ),
            Divider(),
            InkWell(
              onTap: () {
                print(_editedEmp.codEmpresa);
                if (_editedEmp.codEmpresa == null) {
                  if (api.inserirEmpresa(_editedEmp) != null) {
                    print('inseriu empresa');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    print('erro inserir');
                    Dialog(child: Text('Erro ao Inserir Empresa.'));
                  }
                } else {
                  if (api.alterarEmpresa(_editedEmp) != null) {
                    print('alterou empresa');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    print('erro alterar');
                    Dialog(child: Text('Erro ao Alterar Empresa.'));
                  }
                }
              },
              child: Container(
                width: 150,
                height: 50,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Gravar dados!',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
