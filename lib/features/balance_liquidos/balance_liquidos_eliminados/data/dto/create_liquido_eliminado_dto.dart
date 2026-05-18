import 'package:cloud_firestore/cloud_firestore.dart';

class CreateLiquidoEliminadoDto {
  final double orina;
  final double drenajes;
  final double diarreas;
  final double vomito;
  final double perdidasInsensibles;
  final double otros;
  final DateTime hora;
  final String? comentario;

  CreateLiquidoEliminadoDto({
    required this.orina,
    required this.drenajes,
    required this.diarreas,
    required this.vomito,
    required this.perdidasInsensibles,
    required this.otros,
    required this.hora,
    this.comentario,
  });

  // Convertir a Map para Firebase
  Map<String, dynamic> toMap() {
    return {
      'orina': orina,
      'drenajes': drenajes,
      'diarreas': diarreas,
      'vomito': vomito,
      'perdidasInsensibles': perdidasInsensibles,
      'otros': otros,
      'hora': Timestamp.fromDate(hora),
      'comentario': comentario,
    };
  }
}
