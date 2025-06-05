import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  const CampoTexto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(),
    );
  }
}
