import 'package:cloud_firestore/cloud_firestore.dart';

class Glasgow {
  final String idGlasgow;
  final String idIngreso;
  final String idRegistroDiario;
  final int aperturaOcular;
  final int respuestaVerbal;
  final int respuestaMotora;
  final int puntajeTotal;
  final DateTime? horaRegistro;
  final String? observaciones;
  final String? usuarioRegistro;
  final DateTime? fechaCreacion;

  Glasgow({
    required this.idGlasgow,
    required this.idIngreso,
    required this.idRegistroDiario,
    required this.aperturaOcular,
    required this.respuestaVerbal,
    required this.respuestaMotora,
    required this.puntajeTotal,
    this.horaRegistro,
    this.observaciones,
    this.usuarioRegistro,
    this.fechaCreacion,
  });

  Map<String, dynamic> toJson() {
    return {
      'idIngreso': idIngreso,
      'idRegistroDiario': idRegistroDiario,
      'aperturaOcular': aperturaOcular,
      'respuestaVerbal': respuestaVerbal,
      'respuestaMotora': respuestaMotora,
      'puntajeTotal': puntajeTotal,
      'horaRegistro': horaRegistro,
      'observaciones': observaciones,
      'usuarioRegistro': usuarioRegistro,
      'fechaCreacion': fechaCreacion,
    };
  }

  factory Glasgow.fromJson(Map<String, dynamic> json, {required String id}) {
    return Glasgow(
      idGlasgow: id,
      idIngreso: json['idIngreso'] as String,
      idRegistroDiario: json['idRegistroDiario'] as String,
      aperturaOcular: json['aperturaOcular'] as int,
      respuestaVerbal: json['respuestaVerbal'] as int,
      respuestaMotora: json['respuestaMotora'] as int,
      puntajeTotal: json['puntajeTotal'] as int,
      horaRegistro: _parseFecha(json['horaRegistro']),
      observaciones: json['observaciones'] as String?,
      usuarioRegistro: json['usuarioRegistro'] as String?,
      fechaCreacion: _parseFecha(json['fechaCreacion']),
    );
  }

  static DateTime? _parseFecha(dynamic fecha) {
    if (fecha == null) return null;
    if (fecha is Timestamp) return fecha.toDate();
    if (fecha is String) return DateTime.parse(fecha);
    return null;
  }

  String get clasificacion {
    if (puntajeTotal >= 13) return 'Leve';
    if (puntajeTotal >= 9) return 'Moderado';
    return 'Grave';
  }

  static int calcularTotal(int ocular, int verbal, int motora) {
    return ocular + verbal + motora;
  }
}
