import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/nutricion/data/dto/create_registro_nutricional_dto.dart';
import 'package:registro_uci/features/nutricion/data/providers/nutricion_provider.dart';
import 'package:registro_uci/features/nutricion/data/repositories/firebase_nutricion_repository.dart';
import 'package:registro_uci/features/nutricion/domain/models/registro_nutricional.dart';

class CreateRegistroNutricionalForm extends ConsumerStatefulWidget {
  final String idIngreso;

  const CreateRegistroNutricionalForm({
    super.key,
    required this.idIngreso,
  });

  @override
  ConsumerState<CreateRegistroNutricionalForm> createState() =>
      _CreateRegistroNutricionalFormState();
}

class _CreateRegistroNutricionalFormState
    extends ConsumerState<CreateRegistroNutricionalForm> {
  final _formKey = GlobalKey<FormState>();
  final _pesoController = TextEditingController();
  final _tallaController = TextEditingController();
  final _pesoUsualController = TextEditingController();
  final _caloriasAdministradasController = TextEditingController();
  final _caloriasRequeridasController = TextEditingController();
  final _efectosSecundariosController = TextEditingController();
  final _observacionesController = TextEditingController();

  TipoAlimentacion _tipoAlimentacion = TipoAlimentacion.oral;
  bool _toleraAlimentacion = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _pesoController.dispose();
    _tallaController.dispose();
    _pesoUsualController.dispose();
    _caloriasAdministradasController.dispose();
    _caloriasRequeridasController.dispose();
    _efectosSecundariosController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  String? _validarNumeroPositivo(String? value) {
    if (value == null || value.isEmpty) return 'Requerido';
    final numero = double.tryParse(value);
    if (numero == null) return 'Ingrese un número válido';
    if (numero <= 0) return 'Debe ser mayor a 0';
    return null;
  }

  String? _validarNumeroOpcional(String? value) {
    if (value == null || value.isEmpty) return null;
    final numero = double.tryParse(value);
    if (numero == null) return 'Ingrese un número válido';
    if (numero < 0) return 'No puede ser negativo';
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
                'Nuevo Registro Nutricional',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'ANTROPOMETRÍA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _pesoController,
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monitor_weight_outlined),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: _validarNumeroPositivo,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tallaController,
                decoration: const InputDecoration(
                  labelText: 'Talla (cm)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.straighten),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: _validarNumeroPositivo,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _pesoUsualController,
                decoration: const InputDecoration(
                  labelText: 'Peso Usual (kg) - Opcional',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monitor_weight),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: _validarNumeroOpcional,
              ),
              const SizedBox(height: 24),
              const Text(
                'ALIMENTACIÓN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<TipoAlimentacion>(
                value: _tipoAlimentacion,
                decoration: const InputDecoration(
                  labelText: 'Tipo de Alimentación',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.restaurant),
                ),
                items: TipoAlimentacion.values.map((tipo) {
                  return DropdownMenuItem(
                    value: tipo,
                    child: Text(tipo.displayName),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _tipoAlimentacion = value);
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _caloriasAdministradasController,
                decoration: const InputDecoration(
                  labelText: 'Calorías Administradas (kcal)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.local_fire_department),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: _validarNumeroPositivo,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _caloriasRequeridasController,
                decoration: const InputDecoration(
                  labelText: 'Calorías Requeridas (kcal)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.local_fire_department_outlined),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: _validarNumeroPositivo,
              ),
              const SizedBox(height: 24),
              SwitchListTile(
                title: const Text('Tolerancia a la Alimentación'),
                subtitle: Text(
                  _toleraAlimentacion ? 'Sí tolera' : 'No tolera',
                  style: TextStyle(
                    color: _toleraAlimentacion ? Colors.green : Colors.red,
                  ),
                ),
                value: _toleraAlimentacion,
                onChanged: (value) {
                  setState(() => _toleraAlimentacion = value);
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _efectosSecundariosController,
                decoration: const InputDecoration(
                  labelText: 'Efectos Secundarios (opcional)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.warning_amber),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _observacionesController,
                decoration: const InputDecoration(
                  labelText: 'Observaciones (opcional)',
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
        final peso = double.parse(_pesoController.text);
        final talla = double.parse(_tallaController.text);
        final imc = peso / ((talla / 100) * (talla / 100));
        final balance = double.parse(_caloriasAdministradasController.text) -
            double.parse(_caloriasRequeridasController.text);

        final now = DateTime.now();
        final dto = CreateRegistroNutricionalDto(
          peso: peso,
          talla: talla,
          pesoUsual: _pesoUsualController.text.isEmpty
              ? null
              : double.parse(_pesoUsualController.text),
          imc: imc,
          tipoAlimentacion: _tipoAlimentacion,
          caloriasAdministradas:
              double.parse(_caloriasAdministradasController.text),
          caloriasRequeridas: double.parse(_caloriasRequeridasController.text),
          balanceNutricional: balance,
          toleraAlimentacion: _toleraAlimentacion,
          efectosSecundarios: _efectosSecundariosController.text.isEmpty
              ? null
              : _efectosSecundariosController.text,
          fecha: now,
          hora: now,
          observaciones: _observacionesController.text.isEmpty
              ? null
              : _observacionesController.text,
        );

        final repository = FirebaseNutricionRepository();
        await repository.createRegistroNutricional(
          widget.idIngreso,
          dto,
        );

        ref.invalidate(registrosNutricionalesProvider(widget.idIngreso));

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
