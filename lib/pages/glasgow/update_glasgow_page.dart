import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/glasgow/data/providers/glasgow_provider.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/glasgow/presentation/widgets/update_glasgow_form.dart';

class UpdateGlasgowPage extends ConsumerWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final String glasgowId;

  const UpdateGlasgowPage({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
    required this.glasgowId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glasgowAsync = ref.watch(glasgowByIdProvider((
      idIngreso: idIngreso,
      idRegistroDiario: idRegistroDiario,
      idGlasgow: glasgowId,
    )));

    return Scaffold(
      appBar: AppBar(title: const Text('Editar Glasgow')),
      body: glasgowAsync.when(
        data: (glasgow) {
          if (glasgow == null) {
            return const Center(child: Text('Registro no encontrado'));
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: UpdateGlasgowForm(
              idIngreso: idIngreso,
              idRegistroDiario: idRegistroDiario,
              glasgow: glasgow,
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
