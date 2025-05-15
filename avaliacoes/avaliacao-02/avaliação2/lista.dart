import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() => {
    'nome': _nome,
  };
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() => {
    'nome': _nome,
    'dependentes': _dependentes.map((dep) => dep.toJson()).toList(),
  };
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() => {
    'nomeProjeto': _nomeProjeto,
    'funcionarios': _funcionarios.map((func) => func.toJson()).toList(),
  };
}

void main() {

  // 1. Criar varios objetos Dependentes
  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos
  //    funcionarios
  // 4. Criar uma lista de Funcionarios
  // 5. criar um objeto Equipe Projeto chamando o metodo
  //    contrutor que da nome ao projeto e insere uma
  //    coleção de funcionario
  // 6. Printar no formato JSON o objeto Equipe Projeto.



  Dependente luiza = Dependente("Dependente 1 Luiza");
  Dependente giulia = Dependente("Dependente 2 Giulia");
  Dependente jane = Dependente("Dependente 3 Jane");
  Dependente camila = Dependente("Dependente 4 Camila");
  Dependente fran = Dependente("Dependente 5 Fran");
  Dependente neve = Dependente("Dependente 6 Neve");

  Funcionario helena = Funcionario("Funcionário 1 Helena", [luiza, giulia]);
  Funcionario vitoria = Funcionario("Funcionário 2 Vitória", [jane, camila]);
  Funcionario rhania = Funcionario("Funcionário 3 Rhania", [fran, neve]);

  List<Funcionario> funcionarios = [helena, vitoria, rhania]; 

  EquipeProjeto equipe = EquipeProjeto("Equipe Fêmeas Feministas", funcionarios);

  String equipeJson = jsonEncode(equipe);
  print(equipeJson);
}
