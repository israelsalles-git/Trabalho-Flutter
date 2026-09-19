import 'package:flutter/material.dart';

import '../models/musica.dart';
import '../models/musica_ao_vivo.dart';
import '../models/playlist.dart';
import 'cadastro_page.dart';
import 'detalhe_page.dart';
import 'widgets/cartao_musica.dart';

/// Exercício 10 — Estado.
///
/// [HomePage] é um `StatefulWidget` (linha acima) porque guarda o objeto
/// agrupador ([Playlist]) que muda ao longo da execução: cada música
/// cadastrada em [CadastroPage] entra nessa lista dentro de um `setState`
/// (veja [_adicionarMusica]), e é esse aviso ao framework que faz a
/// `ListView` e o total do topo se atualizarem sozinhos.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Playlist _playlist = _montarPlaylistInicial();

  Future<void> _abrirCadastro() async {
    final novaMusica = await Navigator.of(context).push<Musica>(
      MaterialPageRoute(builder: (context) => const CadastroPage()),
    );

    if (novaMusica == null) return;

    _adicionarMusica(novaMusica);
  }

  void _adicionarMusica(Musica musica) {
    setState(() {
      _playlist.adicionar(musica);
    });
  }

  void _abrirDetalhe(Musica musica) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetalhePage(musica: musica)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_playlist.nome),
      ),
      // Exercício 5 — Estrutura de tela: Column com os dois alinhamentos
      // definidos explicitamente. O total fica no topo, e a lista abaixo
      // ocupa o espaço restante dentro de um Expanded.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CabecalhoTotal(playlist: _playlist),
          Expanded(
            // Exercício 7 — Lista dinâmica: itemCount e itemBuilder
            // alimentados diretamente pela Playlist, sem lista solta.
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _playlist.quantidadeMusicas,
              itemBuilder: (context, index) {
                final musica = _playlist.musicas[index];
                return GestureDetector(
                  // Exercício 8 — Navegação com passagem de dados.
                  onTap: () => _abrirDetalhe(musica),
                  child: CartaoMusica(musica: musica),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirCadastro,
        icon: const Icon(Icons.add),
        label: const Text('Nova música'),
      ),
    );
  }
}

class _CabecalhoTotal extends StatelessWidget {
  const _CabecalhoTotal({required this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    final minutos = playlist.duracaoTotalSegundos ~/ 60;
    final segundos = playlist.duracaoTotalSegundos % 60;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${playlist.quantidadeMusicas} músicas',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            // Exercício 4, visível também aqui: o total vem do getter
            // calculado duracaoTotalSegundos, nunca de um campo guardado.
            'Duração total: ${minutos}m ${segundos.toString().padLeft(2, '0')}s',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

/// Playlist de exemplo com seis músicas, já pronta quando o app abre —
/// exigência do exercício 7 (sem tela de carregamento nem lista vazia).
Playlist _montarPlaylistInicial() {
  final playlist = Playlist(nome: 'Clássicos da MPB');
  playlist.adicionar(Musica(
    titulo: 'Águas de Março',
    artista: 'Elis Regina',
    duracaoSegundos: 172,
    lancamento: DateTime(1974, 11, 1),
    avaliacao: 4.9,
  ));
  playlist.adicionar(Musica(
    titulo: 'Construção',
    artista: 'Chico Buarque',
    duracaoSegundos: 396,
    lancamento: DateTime(1971, 1, 1),
    avaliacao: 4.8,
  ));
  playlist.adicionar(Musica(
    titulo: 'Trem das Onze',
    artista: 'Demônios da Garoa',
    duracaoSegundos: 155,
    lancamento: DateTime(1964, 1, 1),
    avaliacao: 4.5,
  ));
  playlist.adicionar(MusicaAoVivo(
    titulo: 'Cheia de Manias',
    artista: 'Raça Negra',
    duracaoSegundos: 245,
    lancamento: DateTime(1998, 6, 20),
    avaliacao: 4.7,
    local: 'Chácara Santo Antônio',
    publico: 12000,
  ));
  playlist.adicionar(Musica(
    titulo: 'Como Nossos Pais',
    artista: 'Elis Regina',
    duracaoSegundos: 264,
    lancamento: DateTime(1976, 1, 1),
    avaliacao: 4.9,
  ));
  playlist.adicionar(Musica(
    titulo: 'O Que Será (À Flor da Pele)',
    artista: 'Chico Buarque',
    duracaoSegundos: 210,
    lancamento: DateTime(1980, 1, 1),
    avaliacao: 4.6,
  ));
  return playlist;
}
