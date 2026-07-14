import 'package:fiore/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProdutoPage extends StatelessWidget {
  const ProdutoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categorias = [
      ("Planner", Icons.event_note_outlined, 12),
      ("Caderno de Receita", Icons.menu_book_outlined, 8),
      ("Caderno A5", Icons.book_outlined, 15),
      ("Caderno A4", Icons.library_books_outlined, 6),
      ("Diário", Icons.auto_stories_outlined, 4),
      ("Bloco", Icons.sticky_note_2_outlined, 20),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Produtos"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          // Abrir cadastro de produto
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            100,
          ),
          itemCount: categorias.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, index) {
            final categoria = categorias[index];

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
                onTap: () {
                  // Abrir lista de produtos dessa categoria
                },
              ),
            );
          },
        ),
      ),
    );
  }
}