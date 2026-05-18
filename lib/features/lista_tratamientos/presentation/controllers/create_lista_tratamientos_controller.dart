import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/lista_tratamientos/domain/models/lista_tratamientos.dart';
import 'package:registro_uci/features/lista_tratamientos/data/abstract_repositories/lista_tratamientos_repository.dart';
import '../../data/providers/lista_tratamientos_provider.dart';

final createListaTratamientosControllerProvider =
    StateNotifierProvider<CreateListaTratamientosController,
        AsyncValue<List<ListaTratamientos>>>(
  (ref) => CreateListaTratamientosController(
      ref.watch(listaTratamientosRepositoryProvider)),
);

class CreateListaTratamientosController
    extends StateNotifier<AsyncValue<List<ListaTratamientos>>> {
  final ListaTratamientosRepository _repository;

  CreateListaTratamientosController(this._repository)
      : super(const AsyncValue.loading());

  void fetchListaTratamientos(String idIngreso, String idRegistroDiario) {
    state = const AsyncValue.loading();
    _repository.getListaTratamientos(idIngreso, idRegistroDiario).listen(
      (result) {
        state = AsyncValue.data(result);
      },
      onError: (e, stack) {
        state = AsyncValue.error('Error al obtener lista de tratamientos', stack);
      },
    );
  }

  Future<void> addListaTratamientos(String idIngreso, String idRegistroDiario,
      ListaTratamientos listaTratamientos) async {
    try {
      await _repository.addListaTratamientos(
          idIngreso, idRegistroDiario, listaTratamientos);
      fetchListaTratamientos(idIngreso, idRegistroDiario);
    } catch (e, stack) {
      state =
          AsyncValue.error('Error al agregar tratamiento', stack);
    }
  }

  Future<void> updateListaTratamientos(
      String idIngreso,
      String idRegistroDiario,
      String idListaTratamientos,
      ListaTratamientos listaTratamientos) async {
    try {
      await _repository.updateListaTratamientos(
          idIngreso, idRegistroDiario, idListaTratamientos, listaTratamientos);
      fetchListaTratamientos(idIngreso, idRegistroDiario);
    } catch (e, stack) {
      state =
          AsyncValue.error('Error al actualizar tratamiento', stack);
    }
  }

  Future<void> deleteListaTratamientos(String idIngreso, String idRegistroDiario,
      String idListaTratamientos) async {
    try {
      await _repository.deleteListaTratamientos(
          idIngreso, idRegistroDiario, idListaTratamientos);
      fetchListaTratamientos(idIngreso, idRegistroDiario);
    } catch (e, stack) {
      state =
          AsyncValue.error('Error al eliminar tratamiento', stack);
    }
  }
}
