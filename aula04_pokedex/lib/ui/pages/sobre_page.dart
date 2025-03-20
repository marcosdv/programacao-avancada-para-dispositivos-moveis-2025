import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sobre a Pokedex'),
          backgroundColor: Color(0xFFFA6F3E),
          centerTitle: true,
        ),
      ),
    );
  }
}