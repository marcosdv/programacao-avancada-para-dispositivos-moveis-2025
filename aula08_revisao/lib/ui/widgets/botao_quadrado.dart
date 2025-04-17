import 'package:flutter/material.dart';

class BotaoQuadrado extends StatelessWidget {
  final Widget titulo;
  final VoidCallback clique;

  const BotaoQuadrado({
    required this.titulo, required this.clique, super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: clique,
      child: titulo
    );
  }
}