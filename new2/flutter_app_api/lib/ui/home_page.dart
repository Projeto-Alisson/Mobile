import 'package:flutter/material.dart';
import 'package:flutter_app_api/classes/api_controller.dart';
import 'package:flutter_app_api/model/empresa_model.dart';
import 'package:flutter_app_api/ui/empresa_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

ApiController api = ApiController();

class _HomePageState extends State<HomePage> {
  List<Empresa> empresas = <Empresa>[];

  @override
  void initState() {
    super.initState();
    _getAllEmpresas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text('Lista de Empresas'),
          ),
        ),
        bottomSheet: Container(
          color: Colors.green,
          height: 60,
          child: InkWell(
            onTap: () {
              _getAllEmpresas();
            },
            child: Center(
              child: Text(
                'Recarregar a Página',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showEmpresa();
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green[300],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: empresas.length,
                  reverse: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    Empresa emp = empresas[index];
                    return InkWell(
                      onTap: () {
                        //Navigator.pop(context);
                        _showEmpresa(empresa: emp);
                      },
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Codigo: ${emp.codEmpresa}"),
                              Text("Nome: ${emp.nomeEmpresa}"),
                              Text("CNPJ: ${emp.cnpjEmpresa}"),
                              Text("Login: ${emp.loginEmpresa}"),
                              Text("Senha: ${emp.senhaEmpresa}"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      api.excluirEmpresa(emp) != null
                                          ? _getAllEmpresas()
                                          : AlertDialog(
                                              title: Text('ERRO'),
                                              content: Text(
                                                  'Ocorreu um problema ao excluir!'),
                                            );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      color: Colors.green[50],
                                      height: 30,
                                      width: 100,
                                      child: Card(
                                        child: Center(child: Text("Excluir")),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void _showEmpresa({Empresa empresa}) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => EmpresaPage(emp: empresa)));
  }

  void _getAllEmpresas() {
    api.getEmpresas().then((list) {
      setState(() {
        empresas = list;
      });
    });
  }
}
