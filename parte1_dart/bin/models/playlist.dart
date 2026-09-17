import 'musica.dart';

/// Exercícios 3 e 4 — Composição e encapsulamento.
///
/// [Playlist] é a classe agrupadora do domínio: ela **tem** uma lista de
/// [Musica] (composição), e não é um tipo de [Musica] (não faria sentido
/// escrever `Playlist extends Musica`).
///
/// A lista interna é privada (`_musicas`, exercício 4) para impedir que
/// código externo a modifique diretamente, contornando o método
/// [adicionar]. O total de duração é exposto por um getter calculado:
/// ele soma [Musica.duracaoSegundos] a cada chamada, em vez de guardar um
/// campo que precisaria ser mantido manualmente em sincronia.
class Playlist {
  final String nome;
  final List<Musica> _musicas = [];

  Playlist({required this.nome});

  /// Acrescenta uma música à playlist. Usado também no exercício 10, na
  /// Parte 2, dentro de um `setState`.
  void adicionar(Musica musica) => _musicas.add(musica);

  /// Cópia somente leitura das músicas contidas, para exibição.
  List<Musica> get musicas => List.unmodifiable(_musicas);

  int get quantidadeMusicas => _musicas.length;

  /// Getter calculado (exercício 4): soma a duração de todas as músicas
  /// no momento da chamada, a partir da lista interna.
  int get duracaoTotalSegundos =>
      _musicas.fold(0, (soma, musica) => soma + musica.duracaoSegundos);
}
