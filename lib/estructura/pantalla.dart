import 'package:flutter/cupertino.dart';

class Pantalla extends StatelessWidget {
  final String texto;
  final String operacion;

  const Pantalla({
    super.key,
    required this.texto,
    this.operacion = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 20,
        bottom: 10,
      ),
      child: Column(
        children: [
          const Spacer(),

          if (operacion.isNotEmpty)
            Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: Text(
                  operacion,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Color(0xFF7E8087),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),

          const SizedBox(height: 10),

          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                texto,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 88,
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}