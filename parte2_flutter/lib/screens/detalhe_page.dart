import 'package:flutter/material.dart';

import '../models/musica.dart';
import '../models/musica_ao_vivo.dart';

/// Exercício 8 — Navegação com passagem de dados.
///
/// [DetalhePage] recebe a [Musica] tocada na lista pelo próprio construtor
/// (linha abaixo), passada por `Navigator.of(context).push` com
/// `MaterialPageRoute` a partir de `home_page.dart`. Mostra dados que não
/// aparecem no cartão da lista: duração, data de lançamento e avaliação
/// — e, quando a música é uma [MusicaAoVivo], também local e público.
class DetalhePage extends StatelessWidget {
  const DetalhePage({super.key, required this.musica});

  final Musica musica;

  @override
  Widget build(BuildContext context) {
    final aoVivo = musica;
    final detalhesAoVivo = aoVivo is MusicaAoVivo ? aoVivo : null;
    final data = musica.lancamento;
    final dataFormatada =
        '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';

    return Scaffold(
      appBar: AppBar(title: Text(musica.titulo)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              musica.titulo,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              musica.artista,
              style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
            ),
            const Divider(height: 40),
            _linhaDado(Icons.timer_outlined, 'Duração', musica.ficha()),
            _linhaDado(Icons.calendar_today_outlined, 'Lançamento', dataFormatada),
            _linhaDado(
              Icons.star_outline,
              'Avaliação',
              '${musica.avaliacao.toStringAsFixed(1)} / 5.0',
            ),
            if (detalhesAoVivo != null) ...[
              _linhaDado(Icons.location_on_outlined, 'Local do show', detalhesAoVivo.local),
              _linhaDado(
                Icons.groups_outlined,
                'Público',
                '${detalhesAoVivo.publico} pessoas',
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _linhaDado(IconData icone, String rotulo, String valor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: Colors.deepPurple),
          const SizedBox(width: 14),
          Text('$rotulo: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(valor)),
        ],
      ),
    );
  }
}
