import 'package:aula08_revisao/ui/widgets/barra_titulo.dart';
import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo().criar('Sobre a Revisão'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.door_back_door, size: 32),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
    );
  }
}
