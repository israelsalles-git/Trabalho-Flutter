import 'package:flutter/material.dart';

import '../../models/musica.dart';

/// Exercício 6 — Cartão do item.
///
/// [CartaoMusica] recebe **um** objeto [Musica] e desenha seus dados como
/// cartão, usando [Container] estilizado com [BoxDecoration] (fundo, borda
/// arredondada e sombra). Fica em arquivo próprio porque é reaproveitado
/// por todos os itens da `ListView.builder` do exercício 7.
class CartaoMusica extends StatelessWidget {
  const CartaoMusica({super.key, required this.musica});

  final Musica musica;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.deepPurple.shade100,
            child: const Icon(Icons.music_note, color: Colors.deepPurple),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  musica.titulo,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  musica.artista,
                  style: TextStyle(color: Colors.grey.shade700),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
