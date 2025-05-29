import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final String texto;
  final Function(String) evento;

  const CampoTexto({ required this.texto,
    required this.evento, super.key });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: TextField(
        onChanged: evento,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: texto,
          prefixText: 'R\$ ',
          border: OutlineInputBorder()
        ),
      ),
    );
  }
}
