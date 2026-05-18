import 'package:registro_uci/features/balance_liquidos/balance_liquidos_eliminados/data/dto/create_liquido_eliminado_dto.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_eliminados/domain/models/liquido_eliminado.dart';

abstract class LiquidosEliminadosRepository {
  Future<void> createLiquidoEliminado(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
    CreateLiquidoEliminadoDto dto,
  );

  Future<void> updateLiquidoEliminado(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
    String idLiquidoEliminado,
    CreateLiquidoEliminadoDto dto,
  );

  Future<void> deleteLiquidoEliminado(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
    String idLiquidoEliminado,
  );

  Future<List<LiquidoEliminado>> getLiquidosEliminados(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
  );
}
