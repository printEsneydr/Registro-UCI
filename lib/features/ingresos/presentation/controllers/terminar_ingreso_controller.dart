import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/ingresos/data/providers/ingreso_by_id_provider.dart';

final terminarIngresoControllerProvider =
    StateNotifierProvider<TerminarIngresoController, AsyncValue<void>>(
  (ref) => TerminarIngresoController(ref),
);

class TerminarIngresoController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  TerminarIngresoController(this.ref) : super(const AsyncValue.data(null));

  Future<void> terminarIngreso(String idIngreso, DateTime fechaFin) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(ingresosRepositoryProvider);
      await repository.terminarIngreso(idIngreso, fechaFin);
      ref.invalidate(ingresoByIdProvider(idIngreso));
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    }
  }
}
