import 'package:fiore/modules/produtos/service/categoria_service.dart';
import 'package:fiore/modules/produtos/view/produto_form_page.dart';
import 'package:flutter/material.dart';

class ProdutoController extends ChangeNotifier {
  final codigoController = TextEditingController();
  final categoriaController = TextEditingController();
  final precoController = TextEditingController();

  bool ativo = true;
  DateTime cadastro = DateTime.now();

  final CategoriaService categoriaService;

  ProdutoController({
    CategoriaService? categoriaService,
  }) : categoriaService = categoriaService ?? CategoriaService();

  List<(String, IconData, int)> get categorias {
    return categoriaService.buscarCategorias();
  }

  String? categoriaSelecionada;

  void alterarCategoria(String value) {
    categoriaSelecionada = value;
    notifyListeners();
  }  

  void adicionarProduto(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProdutoFormPage(controller: this),  
      ),
    );
  }

  void abrirCategoria(BuildContext context, int index) {
    final categoria = categorias[index];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Abrir ${categoria.$1}"),
      ),
    ); 
  }

  void alterarAtivo(bool value) {
    ativo = value;
    notifyListeners();
  }

  void salvar() {

  }

  void alterarCadastro(DateTime value) {
    cadastro = value;
    notifyListeners();
  }

  void limpar() {
    codigoController.clear();
    categoriaController.clear();
    precoController.clear();

    ativo = true;
    cadastro = DateTime.now();

    notifyListeners();
  }

  @override
  void dispose() {
    codigoController.dispose();
    categoriaController.dispose();
    precoController.dispose();
    super.dispose();
  }
}