import 'package:flutter/material.dart';

class CategoriaService {

  List<(String, IconData, int)> buscarCategorias() {
    return [
      ("Planner", Icons.event_note_outlined, 12),
      ("Caderno de Receita", Icons.menu_book_outlined, 8),
      ("Caderno A5", Icons.book_outlined, 15),
      ("Caderno A4", Icons.library_books_outlined, 6),
      ("Diário", Icons.auto_stories_outlined, 4),
      ("Bloco", Icons.sticky_note_2_outlined, 20),
    ];
  }
}