class CalculadoraControlador {
  String pantalla = '0';
  String numero1 = '';
  String operador = '';
  String operacionActual = '';
  bool nuevoNumero = false;

  void presionarBoton(String valor) {
    if (valor == 'AC') {
      limpiar();
    } else if (valor == '⌫') {
      borrar();
    } else if (valor == '%') {
      porcentaje();
    } else if (valor == '+' || valor == '-' || valor == '×' || valor == '÷') {
      guardarOperador(valor);
    } else if (valor == '=') {
      calcular();
    } else if (valor == '.') {
      agregarPunto();
    } else {
      agregarNumero(valor);
    }
  }

  void agregarNumero(String valor) {
    if (pantalla == '0' || nuevoNumero || pantalla == 'Error') {
      pantalla = valor;
      nuevoNumero = false;
    } else {
      pantalla += valor;
    }
  }

  void agregarPunto() {
    if (pantalla == 'Error') {
      pantalla = '0.';
      nuevoNumero = false;
    } else if (nuevoNumero) {
      pantalla = '0.';
      nuevoNumero = false;
    } else if (!pantalla.contains('.')) {
      pantalla += '.';
    }
  }

  void guardarOperador(String valor) {
    if (pantalla == 'Error') {
      limpiar();
      return;
    }

    numero1 = pantalla;
    operador = valor;
    operacionActual = '$numero1 $operador';
    nuevoNumero = true;
  }

  void calcular() {
    if (numero1.isEmpty || operador.isEmpty || pantalla == 'Error') {
      return;
    }

    double n1 = double.parse(numero1);
    double n2 = double.parse(pantalla);
    double resultado = 0;

    if (operador == '+') {
      resultado = n1 + n2;
    } else if (operador == '-') {
      resultado = n1 - n2;
    } else if (operador == '×') {
      resultado = n1 * n2;
    } else if (operador == '÷') {
      if (n2 == 0) {
        pantalla = 'Error';
        operacionActual = '';
        numero1 = '';
        operador = '';
        nuevoNumero = true;
        return;
      }
      resultado = n1 / n2;
    }

    operacionActual = '$numero1 $operador ${limpiarDecimal(n2)} =';
    pantalla = limpiarDecimal(resultado);

    numero1 = '';
    operador = '';
    nuevoNumero = true;
  }

  void porcentaje() {
    if (pantalla == 'Error') {
      return;
    }

    double numero = double.parse(pantalla);
    numero = numero / 100;
    pantalla = limpiarDecimal(numero);
  }

  void limpiar() {
    pantalla = '0';
    numero1 = '';
    operador = '';
    operacionActual = '';
    nuevoNumero = false;
  }

  void borrar() {
    if (pantalla == 'Error') {
      pantalla = '0';
      return;
    }

    if (pantalla.length > 1) {
      pantalla = pantalla.substring(0, pantalla.length - 1);
    } else {
      pantalla = '0';
    }
  }

  String limpiarDecimal(double valor) {
    String resultado = valor.toString();

    if (resultado.endsWith('.0')) {
      resultado = resultado.substring(0, resultado.length - 2);
    }

    return resultado;
  }
}