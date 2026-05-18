import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/nutricion/data/providers/nutricion_provider.dart';
import 'package:registro_uci/features/nutricion/data/repositories/firebase_nutricion_repository.dart';

class DeleteRegistroNutricionalController extends AsyncNotifier<void> {
  late final FirebaseNutricionRepository _repository =
      ref.watch(nutricionRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> deleteRegistroNutricional(
    String idIngreso,
    String idRegistroNutricional,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.deleteRegistroNutricional(
          idIngreso,
          idRegistroNutricional,
        ));

    ref.invalidate(registrosNutricionalesProvider(idIngreso));
    ref.invalidate(ultimoRegistroNutricionalProvider(idIngreso));
  }
}

final deleteRegistroNutricionalControllerProvider =
    AsyncNotifierProvider<DeleteRegistroNutricionalController, void>(
  () => DeleteRegistroNutricionalController(),
);
