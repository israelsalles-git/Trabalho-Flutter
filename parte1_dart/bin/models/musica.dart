/// Exercício 1 — Entidade principal.
///
/// [Musica] é o item individual do domínio: uma faixa que pode compor
/// uma [Playlist] (exercício 3). O construtor usa parâmetros nomeados,
/// com `required` nos campos obrigatórios e valor padrão em [avaliacao].
class Musica {
  final String titulo;
  final String artista;
  final int duracaoSegundos;
  final DateTime lancamento;
  final double avaliacao;

  Musica({
    required this.titulo,
    required this.artista,
    required this.duracaoSegundos,
    required this.lancamento,
    this.avaliacao = 0.0,
  });

  /// Descrição textual da música. Sobrescrito em [MusicaAoVivo] (exercício 2).
  String ficha() {
    final minutos = duracaoSegundos ~/ 60;
    final segundos = duracaoSegundos % 60;
    return '$titulo - $artista, ${minutos}m ${segundos}s, lançada em ${lancamento.year}';
  }
}
