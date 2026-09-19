import 'package:flutter/material.dart';

import '../models/musica.dart';

/// Exercício 9 — Entrada de dados.
///
/// Três campos (título, artista e duração), cada um ligado a um
/// [TextEditingController] (declarados logo abaixo). Sem o controlador o
/// campo aceita texto normalmente, mas o botão de confirmar não tem como
/// recuperar o que foi digitado para montar a [Musica] nova. Os demais
/// atributos do exercício 1 (avaliação e data de lançamento) recebem
/// valor padrão, já que o formulário é limitado a três campos.
class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _tituloController = TextEditingController();
  final _artistaController = TextEditingController();
  final _duracaoController = TextEditingController();

  String? _erro;

  @override
  void dispose() {
    _tituloController.dispose();
    _artistaController.dispose();
    _duracaoController.dispose();
    super.dispose();
  }

  void _confirmar() {
    final titulo = _tituloController.text.trim();
    final artista = _artistaController.text.trim();
    final minutos = double.tryParse(_duracaoController.text.replaceAll(',', '.'));

    if (titulo.isEmpty || artista.isEmpty) {
      setState(() => _erro = 'Preencha título e artista.');
      return;
    }
    if (minutos == null || minutos <= 0) {
      setState(() => _erro = 'Informe uma duração válida, em minutos.');
      return;
    }

    final musica = Musica(
      titulo: titulo,
      artista: artista,
      duracaoSegundos: (minutos * 60).round(),
      lancamento: DateTime.now(),
    );

    Navigator.of(context).pop(musica);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova música')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _tituloController,
              decoration: const InputDecoration(
                labelText: 'Título',
                prefixIcon: Icon(Icons.music_note_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _artistaController,
              decoration: const InputDecoration(
                labelText: 'Artista',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _duracaoController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Duração (minutos)',
                prefixIcon: Icon(Icons.timer_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            if (_erro != null) ...[
              const SizedBox(height: 12),
              Text(_erro!, style: const TextStyle(color: Colors.red)),
            ],
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _confirmar,
              icon: const Icon(Icons.check),
              label: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
