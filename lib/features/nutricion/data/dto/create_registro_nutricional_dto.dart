import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/nutricion/domain/models/registro_nutricional.dart';

class CreateRegistroNutricionalDto {
  final double peso;
  final double talla;
  final double? pesoUsual;
  final double imc;
  final TipoAlimentacion tipoAlimentacion;
  final String? formulaEnteral;
  final double caloriasAdministradas;
  final double caloriasRequeridas;
  final double balanceNutricional;
  final double? proteinas;
  final double? carbohidratos;
  final double? lipidos;
  final bool toleraAlimentacion;
  final String? efectosSecundarios;
  final DateTime fecha;
  final DateTime hora;
  final String? observaciones;

  CreateRegistroNutricionalDto({
    required this.peso,
    required this.talla,
    this.pesoUsual,
    required this.imc,
    required this.tipoAlimentacion,
    this.formulaEnteral,
    required this.caloriasAdministradas,
    required this.caloriasRequeridas,
    required this.balanceNutricional,
    this.proteinas,
    this.carbohidratos,
    this.lipidos,
    required this.toleraAlimentacion,
    this.efectosSecundarios,
    required this.fecha,
    required this.hora,
    this.observaciones,
  });

  Map<String, dynamic> toMap() {
    return {
      'peso': peso,
      'talla': talla,
      'pesoUsual': pesoUsual,
      'imc': imc,
      'tipoAlimentacion': tipoAlimentacion.toString().split('.').last,
      'formulaEnteral': formulaEnteral,
      'caloriasAdministradas': caloriasAdministradas,
      'caloriasRequeridas': caloriasRequeridas,
      'balanceNutricional': balanceNutricional,
      'proteinas': proteinas,
      'carbohidratos': carbohidratos,
      'lipidos': lipidos,
      'toleraAlimentacion': toleraAlimentacion,
      'efectosSecundarios': efectosSecundarios,
      'fecha': Timestamp.fromDate(fecha),
      'hora': Timestamp.fromDate(hora),
      'observaciones': observaciones,
    };
  }
}
