class NutricionService {
  // Calcular IMC
  static double calcularIMC(double peso, double talla) {
    // talla debe estar en metros
    final tallaMetros = talla / 100;
    final imc = peso / (tallaMetros * tallaMetros);
    return _redondear(imc, 2);
  }

  // Calcular requerimiento calórico
  // Fórmula simple: 25-30 kcal/kg para pacientes críticos
  static double calcularRequerimientoCalorico(double peso, String sexo) {
    double factorCalorico;

    if (sexo.toUpperCase() == 'M') {
      // Hombres: 27.5 kcal/kg (promedio de 25-30)
      factorCalorico = 27.5;
    } else {
      // Mujeres: 22.5 kcal/kg (promedio de 20-25)
      factorCalorico = 22.5;
    }

    return _redondear(peso * factorCalorico, 0);
  }

  // Calcular balance nutricional
  static double calcularBalance(
    double caloriasAdministradas,
    double caloriasRequeridas,
  ) {
    return _redondear(caloriasAdministradas - caloriasRequeridas, 0);
  }

  // Clasificar IMC
  static String clasificarIMC(double imc) {
    if (imc < 18.5) {
      return 'Bajo peso';
    } else if (imc >= 18.5 && imc < 25) {
      return 'Normal';
    } else if (imc >= 25 && imc < 30) {
      return 'Sobrepeso';
    } else {
      return 'Obesidad';
    }
  }

  // Generar alertas nutricionales
  static List<String> generarAlertas({
    required double imc,
    required double balanceNutricional,
    required bool toleraAlimentacion,
  }) {
    List<String> alertas = [];

    // Alerta por IMC bajo
    if (imc < 18.5) {
      alertas.add(
          '⚠️ ALERTA: Paciente con bajo peso severo (IMC: ${imc.toStringAsFixed(1)})');
    }

    // Alerta por IMC alto
    if (imc >= 30) {
      alertas.add(
          '⚠️ ADVERTENCIA: Paciente con obesidad (IMC: ${imc.toStringAsFixed(1)})');
    }

    // Alerta por déficit calórico
    if (balanceNutricional < -500) {
      alertas.add(
          '🔴 ALERTA: Déficit calórico significativo (${balanceNutricional.toStringAsFixed(0)} kcal)');
    }

    // Alerta por intolerancia
    if (!toleraAlimentacion) {
      alertas.add('⚠️ ADVERTENCIA: Paciente no tolera la alimentación');
    }

    return alertas;
  }

  // Validar peso
  static bool validarPeso(double peso) {
    return peso >= 30 && peso <= 200;
  }

  // Validar talla
  static bool validarTalla(double talla) {
    return talla >= 140 && talla <= 220;
  }

  // Validar calorías
  static bool validarCalorias(double calorias) {
    return calorias >= 0 && calorias <= 5000;
  }

  // Redondear a N decimales
  static double _redondear(double valor, int decimales) {
    return double.parse(valor.toStringAsFixed(decimales));
  }
}
