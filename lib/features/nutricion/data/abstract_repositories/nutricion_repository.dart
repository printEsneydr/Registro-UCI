import 'package:registro_uci/features/nutricion/data/dto/create_registro_nutricional_dto.dart';
import 'package:registro_uci/features/nutricion/domain/models/registro_nutricional.dart';

abstract class NutricionRepository {
  Future<void> createRegistroNutricional(
    String idIngreso,
    CreateRegistroNutricionalDto dto,
  );

  Future<void> updateRegistroNutricional(
    String idIngreso,
    String idRegistroNutricional,
    CreateRegistroNutricionalDto dto,
  );

  Future<void> deleteRegistroNutricional(
    String idIngreso,
    String idRegistroNutricional,
  );

  Future<List<RegistroNutricional>> getRegistrosNutricionales(
    String idIngreso,
  );

  Future<RegistroNutricional?> getUltimoRegistroNutricional(
    String idIngreso,
  );
}
