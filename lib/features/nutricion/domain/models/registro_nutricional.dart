import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registro_nutricional.freezed.dart';

@freezed
class RegistroNutricional with _$RegistroNutricional {
  const factory RegistroNutricional({
    required String idRegistroNutricional,

    // ANTROPOMETRÍA
    required double peso, // kg
    required double talla, // cm
    double? pesoUsual, // kg (antes de enfermar)
    required double imc, // calculado automáticamente

    // TIPO DE ALIMENTACIÓN
    required TipoAlimentacion tipoAlimentacion,
    String? formulaEnteral, // Si es enteral, nombre de fórmula

    // REGISTRO DIARIO
    required double caloriasAdministradas, // kcal
    required double caloriasRequeridas, // kcal (calculado)
    required double balanceNutricional, // calculado

    // MACRONUTRIENTES (opcional)
    double? proteinas, // gramos
    double? carbohidratos, // gramos
    double? lipidos, // gramos

    // TOLERANCIA
    required bool toleraAlimentacion,
    String? efectosSecundarios, // náuseas, vómitos, diarrea, etc.

    // METADATOS
    required DateTime fecha,
    required DateTime hora,
    String? observaciones,
  }) = _RegistroNutricional;

  factory RegistroNutricional.fromJson(
    Map<String, dynamic> json, {
    required String id,
  }) {
    return RegistroNutricional(
      idRegistroNutricional: id,
      peso: (json['peso'] as num).toDouble(),
      talla: (json['talla'] as num).toDouble(),
      pesoUsual: (json['pesoUsual'] as num?)?.toDouble(),
      imc: (json['imc'] as num).toDouble(),
      tipoAlimentacion: TipoAlimentacion.values.firstWhere(
        (e) => e.toString() == 'TipoAlimentacion.${json['tipoAlimentacion']}',
        orElse: () => TipoAlimentacion.oral,
      ),
      formulaEnteral: json['formulaEnteral'] as String?,
      caloriasAdministradas: (json['caloriasAdministradas'] as num).toDouble(),
      caloriasRequeridas: (json['caloriasRequeridas'] as num).toDouble(),
      balanceNutricional: (json['balanceNutricional'] as num).toDouble(),
      proteinas: (json['proteinas'] as num?)?.toDouble(),
      carbohidratos: (json['carbohidratos'] as num?)?.toDouble(),
      lipidos: (json['lipidos'] as num?)?.toDouble(),
      toleraAlimentacion: json['toleraAlimentacion'] as bool,
      efectosSecundarios: json['efectosSecundarios'] as String?,
      fecha: (json['fecha'] as Timestamp).toDate(),
      hora: (json['hora'] as Timestamp).toDate(),
      observaciones: json['observaciones'] as String?,
    );
  }
}

// ENUM para tipo de alimentación
enum TipoAlimentacion {
  oral,
  enteralContinua,
  enteralIntermitente,
  parenteralTotal,
  parenteralParcial,
  ayuno,
}

// Extensión para obtener el nombre legible
extension TipoAlimentacionExtension on TipoAlimentacion {
  String get displayName {
    switch (this) {
      case TipoAlimentacion.oral:
        return 'Oral';
      case TipoAlimentacion.enteralContinua:
        return 'Enteral Continua';
      case TipoAlimentacion.enteralIntermitente:
        return 'Enteral Intermitente';
      case TipoAlimentacion.parenteralTotal:
        return 'Parenteral Total';
      case TipoAlimentacion.parenteralParcial:
        return 'Parenteral Parcial';
      case TipoAlimentacion.ayuno:
        return 'Ayuno';
    }
  }
}
