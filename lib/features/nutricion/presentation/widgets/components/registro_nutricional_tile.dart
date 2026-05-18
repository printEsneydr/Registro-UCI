import 'package:flutter/material.dart';
import 'package:registro_uci/features/nutricion/domain/models/registro_nutricional.dart';

class RegistroNutricionalTile extends StatelessWidget {
  final RegistroNutricional registro;
  final VoidCallback onDeleteTap;

  const RegistroNutricionalTile({
    super.key,
    required this.registro,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        leading: const Icon(Icons.restaurant_menu, color: Colors.orange),
        title: Text('Fecha: ${_formatDate(registro.fecha)}'),
        subtitle: Text(
          'Calorías: ${registro.caloriasAdministradas.toStringAsFixed(0)} / ${registro.caloriasRequeridas.toStringAsFixed(0)} kcal',
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ANTROPOMETRÍA',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildRow('Peso', '${registro.peso} kg'),
                _buildRow('Talla', '${registro.talla} cm'),
                _buildRow('IMC', registro.imc.toStringAsFixed(1)),
                const Divider(),
                const Text(
                  'ALIMENTACIÓN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildRow('Tipo', registro.tipoAlimentacion.displayName),
                _buildRow(
                  'Balance Nutricional',
                  '${registro.balanceNutricional.toStringAsFixed(0)} kcal',
                ),
                _buildRow(
                  'Tolerancia',
                  registro.toleraAlimentacion ? 'Sí' : 'No',
                ),
                if (registro.efectosSecundarios != null)
                  _buildRow('Efectos', registro.efectosSecundarios!),
                if (registro.observaciones != null)
                  _buildRow('Observaciones', registro.observaciones!),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: onDeleteTap,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
