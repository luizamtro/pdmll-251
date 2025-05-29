import 'dart:convert';
import 'package:provapratica01/revenda.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() async {
  // Criar veículo
  var veiculo = Veiculo(codigo: 1, descricao: 'Moto', valor: 40000.00);

  // Criar vendedor
  var vendedor = Vendedor(codigo: 11, nome: 'Ana Luiza', comissao: 0.07);

  // Criar cliente
  var cliente = Cliente(codigo: 111, nome: 'André', tipoCliente: 1);

  // Criar itens do pedido
  var itens = [
    ItemPedido(
      sequencial: 1,
      descricao: 'Pneu Branco',
      quantidade: 2,
      valor: 500.00,
    ),
    ItemPedido(
      sequencial: 2,
      descricao: 'Capacete',
      quantidade: 2,
      valor: 450.00,
    ),
  ];

  // Criar pedido
  var pedido = PedidoVenda(
    codigo: 'P01',
    data: DateTime.now(),
    valorPedido: 0,
    veiculo: veiculo,
    vendedor: vendedor,
    cliente: cliente,
    itens: itens,
  );

  // Valor total
  double total = pedido.calcularPedido();
  print('Total do Pedido: R\$ $total');

  // JSON
  String jsonPedido = jsonEncode(pedido.toJson());
  print(jsonPedido);

  // Enviar por e-mail
  final smtpServer = gmail(
    'ana.luiza15@aluno.ifce.edu.br',
    'hdrn dyto kauz tqyd',
  );

  final message =
      Message()
        ..from = Address('ana.luiza15@aluno.ifce.edu.br', 'Luiza')
        ..recipients.add('taveira@ifce.edu.br')
        ..subject = 'Pedido de Venda (JSON) - ${DateTime.now()}'
        ..text = 'JSON do pedido de venda:\n\n$jsonPedido';

  try {
    final sendReport = await send(message, smtpServer);
    print('E-mail enviado: ${sendReport.toString()}');
  } on MailerException catch (e) {
    print('Erro ao enviar e-mail: ${e.toString()}');
  }
}
