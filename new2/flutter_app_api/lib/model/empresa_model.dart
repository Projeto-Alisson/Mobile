class Empresa {
  String codEmpresa;
  String nomeEmpresa;
  String cnpjEmpresa;
  String loginEmpresa;
  String senhaEmpresa;

  Empresa({this.codEmpresa, this.nomeEmpresa, this.cnpjEmpresa, this.loginEmpresa, this.senhaEmpresa});

  static List<Empresa> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<Empresa>((item) => Empresa.fromJson(item)).toList();
  }

  Empresa.fromJson(Map<String, dynamic> json) {
    json['cod_empresa'] != null ? codEmpresa = json['cod_empresa'] : codEmpresa = "";
    json['nome_empresa'] != null ? nomeEmpresa = json['nome_empresa'] : nomeEmpresa = "";
    json['cnpj_empresa'] != null ? cnpjEmpresa = json['cnpj_empresa'] : cnpjEmpresa = "";
    json['login_empresa'] != null ? loginEmpresa = json['login_empresa'] : loginEmpresa = "";
    json['senha_empresa'] != null ? senhaEmpresa = json['senha_empresa'] : senhaEmpresa = "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod_empresa'] = this.codEmpresa ?? "";
    data['nome_empresa'] = this.nomeEmpresa ?? "";
    data['cnpj_empresa'] = this.cnpjEmpresa ?? "";
    data['login_empresa'] = this.loginEmpresa ?? "";
    data['senha_empresa'] = this.senhaEmpresa ?? "";
    return data;
  }
}
