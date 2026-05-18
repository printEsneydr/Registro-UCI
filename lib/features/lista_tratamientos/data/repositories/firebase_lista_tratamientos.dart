import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/lista_tratamientos/domain/models/lista_tratamientos.dart';
import 'package:registro_uci/features/lista_tratamientos/data/abstract_repositories/lista_tratamientos_repository.dart';

class FirebaseListaTratamientosRepository implements ListaTratamientosRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addListaTratamientos(
    String idIngreso,
    String idRegistroDiario,
    ListaTratamientos listaTratamientos,
  ) async {
    final ref = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('listaTratamientos');

    await ref.add(listaTratamientos.toJson());
  }

  @override
  Stream<List<ListaTratamientos>> getListaTratamientos(
    String idIngreso,
    String idRegistroDiario,
  ) {
    final ref = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('listaTratamientos');

    return ref.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ListaTratamientos.fromJson(doc.data(), id: doc.id);
      }).toList();
    });
  }

  @override
  Future<void> updateListaTratamientos(
    String idIngreso,
    String idRegistroDiario,
    String idListaTratamientos,
    ListaTratamientos listaTratamientos,
  ) async {
    final ref = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('listaTratamientos')
        .doc(idListaTratamientos);

    await ref.update(listaTratamientos.toJson());
  }

  @override
  Future<void> deleteListaTratamientos(
    String idIngreso,
    String idRegistroDiario,
    String idListaTratamientos,
  ) async {
    final ref = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('listaTratamientos')
        .doc(idListaTratamientos);

    await ref.delete();
  }

  @override
  Future<ListaTratamientos?> getListaTratamientosById(
    String idIngreso,
    String idRegistroDiario,
    String idListaTratamientos,
  ) async {
    final ref = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('listaTratamientos')
        .doc(idListaTratamientos);

    final doc = await ref.get();
    if (doc.exists) {
      return ListaTratamientos.fromJson(doc.data()!, id: doc.id);
    }
    return null;
  }
}
