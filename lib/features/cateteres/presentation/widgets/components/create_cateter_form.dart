import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../data/dto/create_cateter_dto.dart';
import '../../controllers/create_cateter_controller.dart';
import '../../../data/providers/cateteres_providers.dart';
import '../../../data/constants/constants.dart';

class CreateCateterForm extends ConsumerStatefulWidget {
  final String idIngreso;
  const CreateCateterForm({super.key, required this.idIngreso});

  @override
  ConsumerState<CreateCateterForm> createState() => _CreateCateterFormState();
}

class _CreateCateterFormState extends ConsumerState<CreateCateterForm> {
  final _formKey = GlobalKey<FormState>();
  String? _tipo;
  String? _sitio;
  String? _lugarProcedencia;
  DateTime _fechaInsercion = DateTime.now();
  final _dateFormat = DateFormat('dd/MM/yyyy');
  late TextEditingController _fechaController;

  @override
  void initState() {
    super.initState();
    _fechaController = TextEditingController(
      text: _dateFormat.format(_fechaInsercion),
    );
  }

  @override
  void dispose() {
    _fechaController.dispose();
    super.dispose();
  }

  Future<void> _seleccionarFecha() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaInsercion,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _fechaInsercion = picked;
        _fechaController.text = _dateFormat.format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final estado = ref.watch(createCateterControllerProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              InkWell(
                onTap: _seleccionarFecha,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: "Fecha de colocación",
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  child: Text(
                    _fechaController.text,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _tipo,
                items: tiposCateter
                    .map((tipo) => DropdownMenuItem(
                          value: tipo,
                          child: Text(tipo),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _tipo = value),
                decoration: const InputDecoration(
                  labelText: "Tipo de Catéter",
                  prefixIcon: Icon(Icons.category),
                ),
                validator: (value) =>
                    value == null ? 'Seleccione un tipo' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _sitio,
                items: sitiosCateter
                    .map((sitio) => DropdownMenuItem(
                          value: sitio,
                          child: Text(sitio),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _sitio = value),
                decoration: const InputDecoration(
                  labelText: "Sitio",
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) =>
                    value == null ? 'Seleccione un sitio' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _lugarProcedencia,
                items: lugaresProcedenciaCateter
                    .map((lugar) => DropdownMenuItem(
                          value: lugar,
                          child: Text(lugar),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _lugarProcedencia = value),
                decoration: const InputDecoration(
                  labelText: "Lugar de Procedencia",
                  prefixIcon: Icon(Icons.place),
                ),
                validator: (value) =>
                    value == null ? 'Seleccione un lugar' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: estado.isLoading ? null : _guardarCateter,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: estado.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text("Guardar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _guardarCateter() {
    if (_formKey.currentState!.validate()) {
      final nuevoCateter = CreateCateterDto(
        idIngreso: widget.idIngreso,
        tipo: _tipo!,
        sitio: _sitio!,
        fechaInsercion: _fechaInsercion,
        lugarProcedencia: _lugarProcedencia!,
      );

      ref
          .read(createCateterControllerProvider.notifier)
          .createCateter(nuevoCateter)
          .then((_) {
        ref.invalidate(cateteresByIngresoProvider(widget.idIngreso));
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Catéter creado correctamente")),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al crear catéter: $error")),
        );
      });
    }
  }
}
