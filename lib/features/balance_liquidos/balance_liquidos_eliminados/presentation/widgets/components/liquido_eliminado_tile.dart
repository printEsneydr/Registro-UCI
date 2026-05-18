import 'package:flutter/material.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_eliminados/domain/models/liquido_eliminado.dart';

class LiquidoEliminadoTile extends StatelessWidget {
  final LiquidoEliminado liquido;
  final VoidCallback onDeleteTap;

  const LiquidoEliminadoTile({
    super.key,
    required this.liquido,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    final total = liquido.orina +
        liquido.drenajes +
        liquido.diarreas +
        liquido.vomito +
        liquido.perdidasInsensibles +
        liquido.otros;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        leading: const Icon(Icons.delete_outline, color: Colors.red),
        title: Text('Hora: ${liquido.hora.hour}:00'),
        subtitle: Text('Total: $total ml'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow('Orina', liquido.orina),
                _buildRow('Drenajes', liquido.drenajes),
                _buildRow('Diarreas', liquido.diarreas),
                _buildRow('Vómito', liquido.vomito),
                _buildRow('Pérdidas Insensibles', liquido.perdidasInsensibles),
                _buildRow('Otros', liquido.otros),
                if (liquido.comentario != null &&
                    liquido.comentario!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Comentario: ${liquido.comentario}',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
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

  Widget _buildRow(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text('$value ml'),
        ],
      ),
    );
  }
}
