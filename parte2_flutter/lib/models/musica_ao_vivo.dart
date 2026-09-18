import 'musica.dart';

/// Exercício 2 — Herança.
///
/// Toda gravação ao vivo **é uma** música ("é um" -> `extends`), mas
/// acrescenta dados que uma faixa de estúdio não tem: o local do show e
/// o público presente. O construtor repassa os campos herdados com
/// `super`, e [ficha] sobrescreve o método do pai com `@override`,
/// reaproveitando a descrição original e completando-a.
class MusicaAoVivo extends Musica {
  final String local;
  final int publico;

  MusicaAoVivo({
    required super.titulo,
    required super.artista,
    required super.duracaoSegundos,
    required super.lancamento,
    super.avaliacao,
    required this.local,
    required this.publico,
  });

  @override
  String ficha() {
    return '${super.ficha()}, ao vivo em $local para $publico pessoas';
  }
}
