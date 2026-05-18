import 'package:flutter/material.dart';
import '../../features/lista_tratamientos/presentation/widgets/create_lista_tratamientos_form.dart';

class CreateListaTratamientosPage extends StatelessWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const CreateListaTratamientosPage({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Tratamiento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CreateListaTratamientosForm(
          idIngreso: idIngreso,
          idRegistroDiario: idRegistroDiario,
        ),
      ),
    );
  }
}
