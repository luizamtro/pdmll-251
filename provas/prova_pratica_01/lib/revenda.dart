//Veiculo
class Veiculo {
  int codigo;
  String descricao;
  double valor;

  Veiculo({required this.codigo, required this.descricao, required this.valor});

  Map<String, dynamic> toJson() => {
    'Código': codigo,
    'Descrição': descricao,
    'Valor': valor,
  };
}

//Vendedor
class Vendedor {
  int codigo;
  String nome;
  double comissao;

  Vendedor({required this.codigo, required this.nome, required this.comissao});

  Map<String, dynamic> toJson() => {
    'Código': codigo,
    'Nome': nome,
    'Comissão': comissao,
  };
}

//Cliente

class Cliente {
  int codigo;
  String nome;
  int tipoCliente;

  Cliente({
    required this.codigo,
    required this.nome,
    required this.tipoCliente,
  });

  Map<String, dynamic> toJson() => {
    'Código': codigo,
    'Nome': nome,
    'Tipo Cliente': tipoCliente,
  };
}

//Item Pedido
class ItemPedido {
  int sequencial;
  String descricao;
  int quantidade;
  double valor;

  ItemPedido({
    required this.sequencial,
    required this.descricao,
    required this.quantidade,
    required this.valor,
  });

  double get totalItem => quantidade * valor;

  Map<String, dynamic> toJson() => {
    'Sequencial': sequencial,
    'Descrição': descricao,
    'Quantidade': quantidade,
    'Valor': valor,
    'Total Item': totalItem,
  };
}

//Pedido Venda
class PedidoVenda {
  String codigo;
  DateTime data;
  double valorPedido;
  Veiculo veiculo;
  Vendedor vendedor;
  Cliente cliente;
  List<ItemPedido> itens;

  PedidoVenda({
    required this.codigo,
    required this.data,
    required this.valorPedido,
    required this.veiculo,
    required this.vendedor,
    required this.cliente,
    required this.itens,
  });

  double calcularPedido() {
    double totalItens = 0;
    for (var item in itens) {
      totalItens += item.totalItem;
    }
    double total = totalItens + veiculo.valor;
    valorPedido = total;
    return total;
  }

  Map<String, dynamic> toJson() => {
    'Código': codigo,
    'Data': data.toIso8601String(),
    'Valor Pedido': valorPedido,
    'Veiculo': veiculo.toJson(),
    'Vendedor': vendedor.toJson(),
    'Cliente': cliente.toJson(),
    'Itens': itens.map((e) => e.toJson()).toList(),
  };
}
