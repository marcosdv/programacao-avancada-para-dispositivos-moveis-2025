import 'package:flutter/material.dart';

class BotaoQuadrado extends StatelessWidget {
  final String texto;
  final VoidCallback clique;

  const BotaoQuadrado({required this.texto,
      required this.clique, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: clique,
      child: Text(texto)
    );
  }
}
