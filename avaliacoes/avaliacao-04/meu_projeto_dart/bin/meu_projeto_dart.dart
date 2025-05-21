import 'dart:io';
import 'package:sqlite3/sqlite3.dart';

void main() {
  // Conectar ao banco de dados
  final db = sqlite3.open('alunos.db');

  // Criar a tabela TB_ALUNO
  db.execute('''
    CREATE TABLE IF NOT EXISTS TB_ALUNO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL
    )
  ''');

  // Função para inserir dados
  void inserirAluno(String nome) {
    final stmt = db.prepare('INSERT INTO TB_ALUNO (nome) VALUES (?)');
    stmt.execute([nome]);
    stmt.dispose();
    print('Aluno inserido: $nome');
  }

  // Função para ler dados
  void lerAlunos() {
    final ResultSet result = db.select('SELECT * FROM TB_ALUNO');
    for (final row in result) {
      print('ID: ${row['id']}, Nome: ${row['nome']}');
    }
  }

  // Receber dados do teclado
  while (true) {
    stdout.write('Digite o nome do aluno (ou "sair" para encerrar): ');
    String? nome = stdin.readLineSync();
    if (nome == null || nome.toLowerCase() == 'sair') {
      break;
    }
    inserirAluno(nome);
  }

  // Ler e apresentar os dados
  print('Alunos cadastrados:');
  lerAlunos();

  // Fechar a conexão com o banco de dados
  db.dispose();
}