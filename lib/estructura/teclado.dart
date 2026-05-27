import 'package:flutter/cupertino.dart';
import 'boton.dart';

class Teclado extends StatelessWidget {
  final Function(String) alPresionar;

  const Teclado({
    super.key,
    required this.alPresionar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: 18,
      ),
      child: Column(
        children: [
          _fila(['AC', '%', '⌫', '÷']),
          _fila(['7', '8', '9', '×']),
          _fila(['4', '5', '6', '-']),
          _fila(['1', '2', '3', '+']),
          _fila(['00', '0', '.', '=']),
        ],
      ),
    );
  }

  Widget _fila(List<String> textos) {
    return Expanded(
      child: Row(
        children: textos.map((texto) {
          return Expanded(
            child: Boton(
              texto: texto,
              alPresionar: () => alPresionar(texto),
            ),
          );
        }).toList(),
      ),
    );
  }
}