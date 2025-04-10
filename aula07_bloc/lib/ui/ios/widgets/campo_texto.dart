import 'package:flutter/cupertino.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String texto;
  final TextInputType teclado;

  const CampoTexto(this.controller, this.texto,
      this.teclado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CupertinoTextField(
        controller: controller,
        keyboardType: teclado,
        placeholder: texto,
      ),
    );
  }
}
