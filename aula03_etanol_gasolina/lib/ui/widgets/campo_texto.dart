import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final String texto;
  final Widget? icone;
  final TextEditingController controller;

  const CampoTexto(this.controller, this.texto, {this.icone, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 44),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: texto,
          prefixIcon: icone ?? Icon(Icons.attach_money),
          border: OutlineInputBorder()
        ),
      ),
    );
  }
}
