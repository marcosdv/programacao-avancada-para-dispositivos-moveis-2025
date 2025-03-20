import 'package:aula04_pokedex/ui/pages/sobre_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pokedex'),
          backgroundColor: Color(0xFFFA6F3E),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _abrirSobre,
              icon: Icon(Icons.help_outline, size: 32)
            ),
          ],
        ),
      ),
    );
  }

  void _abrirSobre() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SobrePage())
    );
  }
}