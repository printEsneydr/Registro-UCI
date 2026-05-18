import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_eliminados/data/dto/create_liquido_eliminado_dto.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_eliminados/data/providers/liquidos_eliminados_provider.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_eliminados/data/repositories/firebase_liquidos_eliminados_repository.dart';

class CreateLiquidoEliminadoForm extends ConsumerStatefulWidget {
  final LiquidosEliminadosParams params;

  const CreateLiquidoEliminadoForm({super.key, required this.params});

  @override
  ConsumerState<CreateLiquidoEliminadoForm> createState() =>
      _CreateLiquidoEliminadoFormState();
}

class _CreateLiquidoEliminadoFormState
    extends ConsumerState<CreateLiquidoEliminadoForm> {
  final _formKey = GlobalKey<FormState>();
  final _orinaController = TextEditingController(text: '0');
  final _drenajesController = TextEditingController(text: '0');
  final _diarreasController = TextEditingController(text: '0');
  final _vomitoController = TextEditingController(text: '0');
  final _perdidasInsensiblesController = TextEditingController(text: '0');
  final _otrosController = TextEditingController(text: '0');
  final _comentarioController = TextEditingController();
  TimeOfDay _hora = TimeOfDay.now();
  bool _isLoading = false;

  @override
  void dispose() {
    _orinaController.dispose();
    _drenajesController.dispose();
    _diarreasController.dispose();
    _vomitoController.dispose();
    _perdidasInsensiblesController.dispose();
    _otrosController.dispose();
    _comentarioController.dispose();
    super.dispose();
  }

  String? _validarNumero(String? value) {
    if (value == null || value.isEmpty) return 'Requerido';
    if (double.tryParse(value) == null) return 'Número inválido';
    if (double.parse(value) < 0) return 'No puede ser negativo';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nuevo Registro de Líquidos Eliminados',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'ELIMINACIONES',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _orinaController,
                decoration: const InputDecoration(
                  labelText: 'Orina (ml)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.water_drop),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: _validarNumero,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _drenajesController,
                decoration: const InputDecoration(
                  labelText: 'Drenajes (ml)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.plumbing),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: _validarNumero,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _diarreasController,
                decoration: const InputDecoration(
                  labelText: 'Diarreas (ml)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.sick),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: _validarNumero,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _vomitoController,
                decoration: const InputDecoration(
                  labelText: 'Vómito (ml)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.warning),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: _validarNumero,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _perdidasInsensiblesController,
                decoration: const InputDecoration(
                  labelText: 'Pérdidas Insensibles (ml)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.opacity),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: _validarNumero,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _otrosController,
                decoration: const InputDecoration(
                  labelText: 'Otros (ml)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.more_horiz),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: _validarNumero,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: _hora,
                  );
                  if (time != null) {
                    setState(() => _hora = time);
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Hora',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.access_time),
                  ),
                  child: Text(_hora.format(context)),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _comentarioController,
                decoration: const InputDecoration(
                  labelText: 'Comentario (opcional)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.note),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isLoading ? null : () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _guardar,
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Guardar'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _guardar() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        final dto = CreateLiquidoEliminadoDto(
          orina: double.parse(_orinaController.text),
          drenajes: double.parse(_drenajesController.text),
          diarreas: double.parse(_diarreasController.text),
          vomito: double.parse(_vomitoController.text),
          perdidasInsensibles:
              double.parse(_perdidasInsensiblesController.text),
          otros: double.parse(_otrosController.text),
          hora: DateTime(2024, 1, 1, _hora.hour, _hora.minute),
          comentario: _comentarioController.text.isEmpty
              ? null
              : _comentarioController.text,
        );

        final repository = FirebaseLiquidosEliminadosRepository();
        await repository.createLiquidoEliminado(
          widget.params.idIngreso,
          widget.params.idRegistroDiario,
          widget.params.idBalanceLiquidos,
          dto,
        );

        ref.invalidate(liquidosEliminadosProvider(widget.params));

        if (mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registro guardado exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al guardar: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }
}
