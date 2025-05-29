import 'dart:convert';
import 'package:provapratica01/revenda.dart';

void main() {
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
}
