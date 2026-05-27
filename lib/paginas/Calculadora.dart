import 'package:flutter/cupertino.dart';
import '../estructura/pantalla.dart';
import '../estructura/teclado.dart';
import '../Controlador/calculadora_controlador.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final CalculadoraControlador controlador = CalculadoraControlador();

  void tocarBoton(String valor) {
    setState(() {
      controlador.presionarBoton(valor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF101114),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Pantalla(
                texto: controlador.pantalla,
                operacion: controlador.operacionActual,
              ),
            ),
            Expanded(
              flex: 9,
              child: Teclado(
                alPresionar: tocarBoton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}