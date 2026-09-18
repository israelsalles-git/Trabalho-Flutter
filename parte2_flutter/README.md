# Parte 2 — Flutter

Projeto Flutter referente à Parte 2 do trabalho do 1º bimestre. Usa as
mesmas classes de domínio da Parte 1, copiadas para `lib/models/`.

## Domínio

**Playlist de músicas.** `Musica` é o item individual; `Playlist` é a classe
agrupadora, que **tem** uma lista de músicas (composição). `MusicaAoVivo` é
uma especialização de `Musica` por herança, para gravações feitas ao vivo.

## Telas

O aplicativo tem exatamente três telas:

1. **Lista** (`lib/screens/home_page.dart`) — abre já com um objeto
   `Playlist` contendo seis músicas, mostrando o total de duração no topo
   e a lista rolável abaixo.
2. **Detalhe** (`lib/screens/detalhe_page.dart`) — aberta ao tocar em um
   item, com dados que não aparecem no cartão da lista.
3. **Cadastro** (`lib/screens/cadastro_page.dart`) — formulário para
   adicionar uma nova música à playlist.

## Como rodar

```
flutter pub get
flutter run
```

## Onde está cada exercício

| # | Exercício | Recurso / Conceito | Arquivo |
|---|---|---|---|
| 5 | Estrutura de tela | `Scaffold`+`AppBar` / `Column` com `mainAxisAlignment` e `crossAxisAlignment` | [lib/screens/home_page.dart](lib/screens/home_page.dart) |
| 6 | Cartão do item | `Container` / `BoxDecoration` | [lib/screens/widgets/cartao_musica.dart](lib/screens/widgets/cartao_musica.dart) |
| 7 | Lista dinâmica | `ListView.builder` / `itemCount` e `itemBuilder` a partir da `Playlist` | [lib/screens/home_page.dart](lib/screens/home_page.dart) |
| 8 | Navegação com dados | `Navigator.of(context).push` + `MaterialPageRoute` / objeto passado pelo construtor | [lib/screens/home_page.dart](lib/screens/home_page.dart), [lib/screens/detalhe_page.dart](lib/screens/detalhe_page.dart) |
| 9 | Entrada de dados | `TextFormField` / `TextEditingController` | [lib/screens/cadastro_page.dart](lib/screens/cadastro_page.dart) |
| 10 | Estado | `StatefulWidget` / `setState` | [lib/screens/home_page.dart](lib/screens/home_page.dart) |

## Verificação

```
flutter analyze
```

Sem erros, avisos ou sugestões pendentes.
