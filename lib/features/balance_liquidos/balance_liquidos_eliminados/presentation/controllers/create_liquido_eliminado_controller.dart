import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_eliminados/data/dto/create_liquido_eliminado_dto.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_eliminados/data/providers/liquidos_eliminados_provider.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_eliminados/data/repositories/firebase_liquidos_eliminados_repository.dart';

class CreateLiquidoEliminadoController extends AsyncNotifier<void> {
  late final FirebaseLiquidosEliminadosRepository _repository =
      ref.watch(liquidosEliminadosRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> createLiquidoEliminado(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
    CreateLiquidoEliminadoDto dto,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.createLiquidoEliminado(
          idIngreso,
          idRegistroDiario,
          idBalanceLiquidos,
          dto,
        ));

    ref.invalidate(liquidosEliminadosProvider(LiquidosEliminadosParams(
      idIngreso: idIngreso,
      idRegistroDiario: idRegistroDiario,
      idBalanceLiquidos: idBalanceLiquidos,
    )));
  }
}

final createLiquidoEliminadoControllerProvider =
    AsyncNotifierProvider<CreateLiquidoEliminadoController, void>(
  () => CreateLiquidoEliminadoController(),
);
