import 'package:registro_uci/features/lista_tratamientos/domain/models/lista_tratamientos.dart';

abstract class ListaTratamientosRepository {
  Stream<List<ListaTratamientos>> getListaTratamientos(
    String idIngreso,
    String idRegistroDiario,
  );

  Future<void> addListaTratamientos(
    String idIngreso,
    String idRegistroDiario,
    ListaTratamientos listaTratamientos,
  );

  Future<void> updateListaTratamientos(
    String idIngreso,
    String idRegistroDiario,
    String idListaTratamientos,
    ListaTratamientos listaTratamientos,
  );

  Future<void> deleteListaTratamientos(
    String idIngreso,
    String idRegistroDiario,
    String idListaTratamientos,
  );

  Future<ListaTratamientos?> getListaTratamientosById(
    String idIngreso,
    String idRegistroDiario,
    String idListaTratamientos,
  );
}
