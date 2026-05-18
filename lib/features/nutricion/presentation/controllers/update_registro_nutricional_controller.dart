import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/nutricion/data/dto/create_registro_nutricional_dto.dart';
import 'package:registro_uci/features/nutricion/data/providers/nutricion_provider.dart';
import 'package:registro_uci/features/nutricion/data/repositories/firebase_nutricion_repository.dart';

class UpdateRegistroNutricionalController extends AsyncNotifier<void> {
  late final FirebaseNutricionRepository _repository =
      ref.watch(nutricionRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> updateRegistroNutricional(
    String idIngreso,
    String idRegistroNutricional,
    CreateRegistroNutricionalDto dto,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.updateRegistroNutricional(
          idIngreso,
          idRegistroNutricional,
          dto,
        ));

    ref.invalidate(registrosNutricionalesProvider(idIngreso));
    ref.invalidate(ultimoRegistroNutricionalProvider(idIngreso));
  }
}

final updateRegistroNutricionalControllerProvider =
    AsyncNotifierProvider<UpdateRegistroNutricionalController, void>(
  () => UpdateRegistroNutricionalController(),
);
