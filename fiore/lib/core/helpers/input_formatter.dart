import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digits.isEmpty) {
      final empty = '0,00';
      return TextEditingValue(
        text: empty,
        selection: TextSelection.collapsed(offset: empty.length),
      );
    }

    final cents = int.parse(digits);

    final reaisNum = cents ~/ 100;
    final centavosNum = cents % 100;

    final centavos = centavosNum.toString().padLeft(2, '0');

    String reais = reaisNum.toString();
    reais = reais.replaceAllMapped(RegExp(r"\B(?=(\d{3})+(?!\d))"), (m) => '.');

    final novoTexto = '$reais,$centavos'.replaceFirst('\$', reais);

    return TextEditingValue(
      text: novoTexto,
      selection: TextSelection.collapsed(offset: novoTexto.length),
    );
  }
}
