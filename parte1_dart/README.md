# Parte 1 — Dart puro

Projeto Dart puro (sem Flutter) referente à Parte 1 do trabalho do 1º bimestre.

## Domínio

**Playlist de músicas.** `Musica` é o item individual; `Playlist` é a classe
agrupadora, que **tem** uma lista de músicas (composição). `MusicaAoVivo` é
uma especialização de `Musica` por herança, para gravações feitas ao vivo.

## Estrutura

```
bin/
├── main.dart               # único executável: imprime o relatório com os 4 blocos
└── models/
    ├── musica.dart          # Exercício 1 (entidade principal) e base do Exercício 2 (herança)
    ├── musica_ao_vivo.dart  # Exercício 2 (herança)
    └── playlist.dart        # Exercícios 3 (composição) e 4 (encapsulamento)
```

## Como rodar

```
dart pub get
dart run bin/main.dart
```

A saída imprime os quatro blocos numerados exigidos pelo trabalho:
`[1] Entidade principal`, `[2] Herança`, `[3] Composição` e
`[4] Encapsulamento`.

## Onde está cada exercício

| # | Exercício | Arquivo |
|---|---|---|
| 1 | Entidade principal (`class` com construtor nomeado + `required`) | [bin/models/musica.dart](bin/models/musica.dart) |
| 2 | Herança (`extends`, `super`, `@override`) | [bin/models/musica_ao_vivo.dart](bin/models/musica_ao_vivo.dart) |
| 3 | Composição (`List<Musica>` dentro de `Playlist`) | [bin/models/playlist.dart](bin/models/playlist.dart) |
| 4 | Encapsulamento (`_musicas` privada + getter calculado) | [bin/models/playlist.dart](bin/models/playlist.dart) |

### Por que `Playlist` é composição, e não herança

Uma `Playlist` **contém** músicas, mas não **é** uma música — não faz sentido
dizer que "toda playlist é uma música". Por isso a relação entre `Playlist` e
`Musica` é modelada com um atributo `List<Musica>`, e não com `extends`. Já
`MusicaAoVivo` **é** uma música (uma especialização dela), o que justifica o
`extends` nesse caso.

## Verificação

```
dart analyze
```

Sem erros, avisos ou sugestões pendentes.
