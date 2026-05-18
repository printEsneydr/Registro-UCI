import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'liquido_eliminado.freezed.dart';

@freezed
class LiquidoEliminado with _$LiquidoEliminado {
  const factory LiquidoEliminado({
    required String idLiquidoEliminado,

    // Campos de eliminados (según imagen de sábana)
    required double orina,
    required double drenajes,
    required double diarreas,
    required double vomito,
    required double perdidasInsensibles,
    required double otros,

    // Metadatos
    required DateTime hora,
    String? comentario,
  }) = _LiquidoEliminado;

  factory LiquidoEliminado.fromJson(
    Map<String, dynamic> json, {
    required String id,
  }) {
    return LiquidoEliminado(
      idLiquidoEliminado: id,
      orina: (json['orina'] as num?)?.toDouble() ?? 0.0,
      drenajes: (json['drenajes'] as num?)?.toDouble() ?? 0.0,
      diarreas: (json['diarreas'] as num?)?.toDouble() ?? 0.0,
      vomito: (json['vomito'] as num?)?.toDouble() ?? 0.0,
      perdidasInsensibles:
          (json['perdidasInsensibles'] as num?)?.toDouble() ?? 0.0,
      otros: (json['otros'] as num?)?.toDouble() ?? 0.0,
      hora: (json['hora'] as Timestamp).toDate(),
      comentario: json['comentario'] as String?,
    );
  }
}
