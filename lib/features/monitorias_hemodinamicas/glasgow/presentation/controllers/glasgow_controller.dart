import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/glasgow/domain/models/glasgow.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/glasgow/data/abstract_repositories/glasgow_repository.dart';
import '../../data/providers/glasgow_provider.dart';

final glasgowControllerProvider =
    StateNotifierProvider<GlasgowController, AsyncValue<List<Glasgow>>>(
  (ref) => GlasgowController(
      ref.watch(glasgowRepositoryProvider)),
);

class GlasgowController
    extends StateNotifier<AsyncValue<List<Glasgow>>> {
  final GlasgowRepository _repository;

  GlasgowController(this._repository)
      : super(const AsyncValue.loading());

  void fetchGlasgow(String idIngreso, String idRegistroDiario) {
    state = const AsyncValue.loading();
    _repository.getGlasgow(idIngreso, idRegistroDiario).listen(
      (result) {
        state = AsyncValue.data(result);
      },
      onError: (e, stack) {
        state = AsyncValue.error('Error al obtener registros de Glasgow', stack);
      },
    );
  }

  Future<void> addGlasgow(String idIngreso, String idRegistroDiario,
      Glasgow glasgow) async {
    try {
      await _repository.addGlasgow(
          idIngreso, idRegistroDiario, glasgow);
      fetchGlasgow(idIngreso, idRegistroDiario);
    } catch (e, stack) {
      state =
          AsyncValue.error('Error al agregar registro de Glasgow', stack);
    }
  }

  Future<void> updateGlasgow(
      String idIngreso,
      String idRegistroDiario,
      String idGlasgow,
      Glasgow glasgow) async {
    try {
      await _repository.updateGlasgow(
          idIngreso, idRegistroDiario, idGlasgow, glasgow);
      fetchGlasgow(idIngreso, idRegistroDiario);
    } catch (e, stack) {
      state =
          AsyncValue.error('Error al actualizar registro de Glasgow', stack);
    }
  }

  Future<void> deleteGlasgow(String idIngreso, String idRegistroDiario,
      String idGlasgow) async {
    try {
      await _repository.deleteGlasgow(
          idIngreso, idRegistroDiario, idGlasgow);
      fetchGlasgow(idIngreso, idRegistroDiario);
    } catch (e, stack) {
      state =
          AsyncValue.error('Error al eliminar registro de Glasgow', stack);
    }
  }
}
