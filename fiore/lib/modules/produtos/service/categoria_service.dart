import 'package:fiore/modules/produtos/model/categoria.dart';

class CategoriaService {

  List<Categoria> buscarCategorias() {
    return const [
      Categoria(nome: "Planner", quantidade: 12),
      Categoria(nome: "Caderno de Receita", quantidade: 8),
      Categoria(nome: "Caderno A5", quantidade: 15),
      Categoria(nome: "Caderno A4", quantidade: 6),
      Categoria(nome: "Diário", quantidade: 4),
      Categoria(nome: "Bloco", quantidade: 20),
    ];
  }
}
