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

  Widget contenidoBoton() {
    if (texto == '⌫') {
      return const Icon(
        CupertinoIcons.delete_left,
        color: Color(0xFFF4F4F4),
        size: 30,
      );
    }

    return Text(
      texto,
      style: TextStyle(
        color: const Color(0xFFF4F4F4),
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
              color: esIgual
                  ? const Color(0xFFF5A623)
                  : const Color(0xFF2A2C31),
              border: Border.all(
                color: esIgual
                    ? const Color(0x22FFFFFF)
                    : const Color(0x18FFFFFF),
                width: 1,
              ),
              boxShadow: esIgual
                  ? const [
                      BoxShadow(
                        color: Color(0x33F5A623),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ]
                  : const [
                      BoxShadow(
                        color: Color(0x66070708),
                        blurRadius: 10,
                        offset: Offset(4, 5),
                      ),
                    ],
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