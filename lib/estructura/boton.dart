import 'package:flutter/cupertino.dart';

class Boton extends StatelessWidget {
  final String texto;
  final VoidCallback alPresionar;

  const Boton({
    super.key,
    required this.texto,
    required this.alPresionar,
  });

  bool get esIgual => texto == '=';

  bool get esNumero {
    return texto == '0' ||
        texto == '00' ||
        texto == '1' ||
        texto == '2' ||
        texto == '3' ||
        texto == '4' ||
        texto == '5' ||
        texto == '6' ||
        texto == '7' ||
        texto == '8' ||
        texto == '9' ||
        texto == '.';
  }

  bool get esOperador {
    return texto == '+' ||
        texto == '-' ||
        texto == '×' ||
        texto == '÷';
  }

  bool get esAccion {
    return texto == 'AC' || texto == '%' || texto == '⌫';
  }

  Color get colorBoton {
    if (esIgual) {
      return const Color(0x14FFFFFF); 
    }

    if (esNumero) {
      return const Color(0xFF15161A); 
    }

    if (esOperador || esAccion) {
      return const Color(0xFF3A3B40); 
    }

    return const Color(0xFF2A2C31);
  }

  Color get colorBorde {
    if (esIgual) {
      return const Color(0x44FFFFFF);
    }

    if (esNumero) {
      return const Color(0x14FFFFFF);
    }

    return const Color(0x22FFFFFF);
  }

  List<BoxShadow> get sombraBoton {
    if (esIgual) {
      return const [
        BoxShadow(
          color: Color(0x14FFFFFF),
          blurRadius: 16,
          offset: Offset(0, 6),
        ),
      ];
    }

    return const [
      BoxShadow(
        color: Color(0x88000000),
        blurRadius: 12,
        offset: Offset(4, 6),
      ),
    ];
  }

  Widget contenidoBoton() {
    if (texto == '⌫') {
      return const Icon(
        CupertinoIcons.delete_left,
        color: Color.fromARGB(255, 7, 244, 54),
        size: 30,
      );
    }

    return Text(
      texto,
      style: TextStyle(
        color: const Color.fromARGB(255, 7, 244, 54),
        fontSize: texto == '00' ? 30 : 36,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: GestureDetector(
        onTap: alPresionar,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorBoton,
              border: Border.all(
                color: colorBorde,
                width: 1,
              ),
              boxShadow: sombraBoton,
            ),
            child: Center(
              child: contenidoBoton(),
            ),
          ),
        ),
      ),
    );
  }
}