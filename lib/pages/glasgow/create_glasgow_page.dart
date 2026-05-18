import 'package:flutter/material.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/glasgow/presentation/widgets/create_glasgow_form.dart';

class CreateGlasgowPage extends StatelessWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const CreateGlasgowPage({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Registro Glasgow')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CreateGlasgowForm(
          idIngreso: idIngreso,
          idRegistroDiario: idRegistroDiario,
        ),
      ),
    );
  }
}
