import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/lista_tratamientos/data/repositories/firebase_lista_tratamientos.dart';
import 'package:registro_uci/features/lista_tratamientos/domain/models/lista_tratamientos.dart';
import 'package:registro_uci/features/lista_tratamientos/data/abstract_repositories/lista_tratamientos_repository.dart';

final listaTratamientosRepositoryProvider =
    Provider<ListaTratamientosRepository>((ref) {
  return FirebaseListaTratamientosRepository();
});

final listaTratamientosByIngresoProvider = StreamProvider.family<
    List<ListaTratamientos>, ({String idIngreso, String idRegistroDiario})>(
  (ref, params) {
    final repository = ref.watch(listaTratamientosRepositoryProvider);
    return repository.getListaTratamientos(
      params.idIngreso,
      params.idRegistroDiario,
    );
  },
);

final listaTratamientosByIdProvider = FutureProvider.family<
    ListaTratamientos?,
    ({String idIngreso, String idRegistroDiario, String idListaTratamientos})>(
  (ref, params) async {
    final repository = ref.read(listaTratamientosRepositoryProvider);
    return await repository.getListaTratamientosById(
      params.idIngreso,
      params.idRegistroDiario,
      params.idListaTratamientos,
    );
  },
);
