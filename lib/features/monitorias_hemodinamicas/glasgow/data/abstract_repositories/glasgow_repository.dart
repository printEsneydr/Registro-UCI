import 'package:registro_uci/features/monitorias_hemodinamicas/glasgow/domain/models/glasgow.dart';

abstract class GlasgowRepository {
  Stream<List<Glasgow>> getGlasgow(
    String idIngreso,
    String idRegistroDiario,
  );

  Future<void> addGlasgow(
    String idIngreso,
    String idRegistroDiario,
    Glasgow glasgow,
  );

  Future<void> updateGlasgow(
    String idIngreso,
    String idRegistroDiario,
    String idGlasgow,
    Glasgow glasgow,
  );

  Future<void> deleteGlasgow(
    String idIngreso,
    String idRegistroDiario,
    String idGlasgow,
  );

  Future<Glasgow?> getGlasgowById(
    String idIngreso,
    String idRegistroDiario,
    String idGlasgow,
  );
}
