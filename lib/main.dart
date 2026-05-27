import 'package:flutter/cupertino.dart';
import 'paginas/Calculadora.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      home: Calculadora(),
    );
  }
}