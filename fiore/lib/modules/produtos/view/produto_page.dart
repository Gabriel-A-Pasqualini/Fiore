import 'package:fiore/core/theme/app_colors.dart';
import 'package:fiore/modules/produtos/controller/produto_controller.dart';
import 'package:flutter/material.dart';

class ProdutoPage extends StatelessWidget {
  ProdutoPage({super.key});

  final ProdutoController controller = ProdutoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produtos"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => controller.adicionarProduto(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            100,
          ),
          itemCount: controller.categorias.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, index) {
            final categoria = controller.categorias[index];

            return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.primary.withOpacity(.1),
                  child: Icon(
                    categoria.$2,
                    color: AppColors.primary,
                  ),
                ),
                title: Text(
                  categoria.$1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  "${categoria.$3} produtos",
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => controller.abrirCategoria(context, index),
              ),
            );
          },
        ),
      ),
    );
  }
}