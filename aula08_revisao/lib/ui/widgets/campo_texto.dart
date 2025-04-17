import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String texto;
  final Widget? prefixo;
  final TextInputType? teclado;

  const CampoTexto({
    required this.controller, required this.texto,
    this.prefixo, this.teclado, super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: TextField(
        controller: controller,
        keyboardType: teclado,
        decoration: InputDecoration(
          labelText: texto,
          prefix: prefixo,
          border: const OutlineInputBorder()
        ),
      ),
    );
  }
}
