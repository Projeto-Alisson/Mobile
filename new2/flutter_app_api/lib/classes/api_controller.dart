import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app_api/model/empresa_model.dart';

class ApiController {
  final linkGet =
      'https://apiprojetotoledo1.herokuapp.com/view/empresa/listar.php';
  final linkInserir =
      'https://apiprojetotoledo1.herokuapp.com/view/empresa/inserir.php';
  final linkAlterar =
      'https://apiprojetotoledo1.herokuapp.com/view/empresa/editar.php';
  final linkExcluir =
      'https://apiprojetotoledo1.herokuapp.com/view/empresa/excluir.php';

  var dio = new Dio();

  Future<List<Empresa>> getEmpresas() async {
    try {
      var response = await dio.post(linkGet);
      List<Empresa> listEmp = <Empresa>[];
      listEmp = Empresa.fromJsonList(response.data);
      return listEmp;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Empresa>> inserirEmpresa(Empresa emp) async {
    var insEmp = emp.toJson();

    var response = await dio
        .post(linkInserir,
            data: insEmp,
            options: Options(
                contentType: "application/json",
                headers: {"Accept": "application/json"},
                followRedirects: false,
                validateStatus: (status) {
                  return status < 500;
                }))
        .catchError((err) {
      print(err.toString());
    });

    // Não deve-se redirecionar no BackEnd apos uma requisição. [Gambiarra]
    if (response.statusCode == 302) {
      return getEmpresas();
    }
  }

  Future<List<Empresa>> alterarEmpresa(Empresa emp) async {
    var altEmp = emp.toJson();
    var response = await dio
        .post(linkAlterar,
            data: altEmp,
            options: Options(
                contentType: "application/json",
                headers: {"Accept": "application/json"},
                followRedirects: false,
                validateStatus: (status) {
                  return status < 500;
                }))
        .catchError((err) {
      print(err.toString());
    });

    // Não deve-se redirecionar no BackEnd apos uma requisição. [Gambiarra]
    if (response.statusCode == 302) {
      return getEmpresas();
    }
  }

  Future<List<Empresa>> excluirEmpresa(Empresa emp) async {
    var excEmp = emp.toJson();

    var response = await dio
        .post(linkExcluir,
            data: excEmp,
            options: Options(
                contentType: "application/json",
                headers: {"Accept": "application/json"},
                followRedirects: false,
                validateStatus: (status) {
                  return status < 500;
                }))
        .catchError((err) {
      print(err.toString());
    });

    // Não deve-se redirecionar no BackEnd apos uma requisição. [Gambiarra]
    if (response.statusCode == 302) {
      return getEmpresas();
    }
  }
}
