import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/balance_liquidos/domain/models/balance_de_liquidos.dart';

abstract class BalancesDeLiquidosRepository {
  Future<List<BalanceDeLiquidos>> getBalancesDeLiquidos(
    String idIngreso,
    String idRegistroDiario,
  );
  Future<DocumentSnapshot<Map<String, dynamic>>> getBalanceDeLiquidosDoc(
    String idIngreso,
    String idRegistroDiario,
  );
}
