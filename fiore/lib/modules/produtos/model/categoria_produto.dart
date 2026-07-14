class CategoriaProduto {
  final int? codigo;
  final String descricao;
  final DateTime cadastro;
  final bool ativo;

  const CategoriaProduto({
    this.codigo,
    required this.descricao,
    required this.cadastro,
    required this.ativo,
  });
}