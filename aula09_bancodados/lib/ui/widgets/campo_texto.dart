import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String? texto;
  final TextInputType? teclado;
  final bool? isHabilitado;

  const CampoTexto({required this.controller,
    this.texto, this.teclado, this.isHabilitado, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        enabled: isHabilitado,
        controller: controller,
        keyboardType: teclado,
        decoration: InputDecoration(
          labelText: texto,
          border: const OutlineInputBorder()
        ),
      ),
    );
  }
}