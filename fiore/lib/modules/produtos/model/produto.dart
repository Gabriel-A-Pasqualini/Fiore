class Produto {
  final int? codigo;
  final int categoriaId;
  final double preco;
  final DateTime cadastro;
  final bool ativo;

  const Produto({
    this.codigo,
    required this.categoriaId,
    required this.preco,
    required this.cadastro,
    required this.ativo,
  });

  Produto copyWith({
    int? codigo,
    int? categoriaId,
    double? preco,
    DateTime? cadastro,
    bool? ativo,
  }) {
    return Produto(
      codigo: codigo ?? this.codigo,
      categoriaId: categoriaId ?? this.categoriaId,
      preco: preco ?? this.preco,
      cadastro: cadastro ?? this.cadastro,
      ativo: ativo ?? this.ativo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'categoriaId': categoriaId,
      'preco': preco,
      'cadastro': cadastro.toIso8601String(),
      'ativo': ativo,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      codigo: map['codigo'],
      categoriaId: map['categoriaId'],
      preco: (map['preco'] as num).toDouble(),
      cadastro: DateTime.parse(map['cadastro']),
      ativo: map['ativo'],
    );
  }
}