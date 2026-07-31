import 'package:flutter/material.dart';

IconData iconForCategoria(String nome) {
  final key = nome.toLowerCase();
  if (key.contains('planner')) return Icons.event_note_outlined;
  if (key.contains('receita')) return Icons.menu_book_outlined;
  if (key.contains('a5')) return Icons.book_outlined;
  if (key.contains('a4')) return Icons.library_books_outlined;
  if (key.contains('diár') || key.contains('diar')) return Icons.auto_stories_outlined;
  if (key.contains('bloco')) return Icons.sticky_note_2_outlined;
  return Icons.category_outlined;
}
