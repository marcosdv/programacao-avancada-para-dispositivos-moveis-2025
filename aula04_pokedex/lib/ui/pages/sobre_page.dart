import 'package:aula04_pokedex/ui/widgets/barra_titulo.dart';
import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo().criar('Sobre a Pokedex'),
      ),
    );
  }
}