import 'models/musica.dart';
import 'models/musica_ao_vivo.dart';
import 'models/playlist.dart';

/// Parte 1 — relatório único que demonstra os quatro exercícios.
///
/// Domínio: uma playlist de músicas. [Musica] é o item individual
/// (exercício 1), [MusicaAoVivo] é a especialização por herança
/// (exercício 2), e [Playlist] é a classe agrupadora, ligada a
/// [Musica] por composição (exercícios 3 e 4).
void main() {
  bloco1EntidadePrincipal();
  bloco2Heranca();
  bloco3Composicao();
  bloco4Encapsulamento();
}

void bloco1EntidadePrincipal() {
  print('===== [1] ENTIDADE PRINCIPAL =====');
  final musica = Musica(
    titulo: 'Águas de Março',
    artista: 'Elis Regina',
    duracaoSegundos: 172,
    lancamento: DateTime(1974, 11, 1),
  );
  print(musica.ficha());
  print('');
}

void bloco2Heranca() {
  print('===== [2] HERANÇA =====');
  final estudio = Musica(
    titulo: 'Cheia de Manias',
    artista: 'Raça Negra',
    duracaoSegundos: 210,
    lancamento: DateTime(1996, 1, 1),
  );
  final aoVivo = MusicaAoVivo(
    titulo: 'Cheia de Manias',
    artista: 'Raça Negra',
    duracaoSegundos: 245,
    lancamento: DateTime(1998, 6, 20),
    local: 'Chácara Santo Antônio',
    publico: 12000,
  );
  print('Música de estúdio -> ficha: "${estudio.ficha()}"');
  print('MusicaAoVivo -> ficha: "${aoVivo.ficha()}"');
  print('');
}

void bloco3Composicao() {
  print('===== [3] COMPOSIÇÃO =====');
  final playlist = montarPlaylist();
  print('Playlist "${playlist.nome}" contém ${playlist.quantidadeMusicas} músicas:');
  for (final musica in playlist.musicas) {
    print('  - ${musica.titulo}');
  }
  print('');
}

void bloco4Encapsulamento() {
  print('===== [4] ENCAPSULAMENTO =====');
  final playlist = montarPlaylist();
  print('Playlist "${playlist.nome}" -> duração total (calculada): '
      '${playlist.duracaoTotalSegundos}s');

  playlist.adicionar(Musica(
    titulo: 'Trem das Onze',
    artista: 'Demônios da Garoa',
    duracaoSegundos: 155,
    lancamento: DateTime(1964, 1, 1),
  ));

  print('Após adicionar "Trem das Onze" (155s): '
      '${playlist.duracaoTotalSegundos}s');
}

/// Monta a playlist de exemplo usada nos blocos [3] e [4].
Playlist montarPlaylist() {
  final playlist = Playlist(nome: 'Clássicos da MPB');
  playlist.adicionar(Musica(
    titulo: 'Águas de Março',
    artista: 'Elis Regina',
    duracaoSegundos: 172,
    lancamento: DateTime(1974, 11, 1),
  ));
  playlist.adicionar(Musica(
    titulo: 'Cheia de Manias',
    artista: 'Raça Negra',
    duracaoSegundos: 210,
    lancamento: DateTime(1996, 1, 1),
  ));
  playlist.adicionar(Musica(
    titulo: 'Construção',
    artista: 'Chico Buarque',
    duracaoSegundos: 396,
    lancamento: DateTime(1971, 1, 1),
  ));
  return playlist;
}
