import 'package:aula08_revisao/ui/pages/sobre_page.dart';
import 'package:aula08_revisao/ui/widgets/barra_titulo.dart';
import 'package:aula08_revisao/ui/widgets/botao_quadrado.dart';
import 'package:aula08_revisao/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _campoNome = TextEditingController();
  final _campoIdade = TextEditingController();
  var _textoResultado = '';

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo().criar('Aula de Revisão'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.help, size: 32),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (_) => SobrePage()));
          }
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CampoTexto(
                controller: _campoNome,
                texto: 'Nome',
                teclado: TextInputType.name,
              ),

              CampoTexto(
                controller: _campoIdade,
                texto: 'Idade',
                teclado: TextInputType.numberWithOptions(decimal: false, signed: false),
              ),

              BotaoQuadrado(
                titulo: Text('Calcular'),
                clique: _calcular
              ),

              SizedBox(height: 44),

              Text(_textoResultado),
            ],
          ),
        ),
      ),
    );
  }

  void _calcular() {
    var idade = int.tryParse(_campoIdade.text) ?? 0;
    if (idade <= 0) {
      _textoResultado = 'Idade digitada inválida!';
    }
    else {
      if (idade >= 18) {
        _textoResultado = '${_campoNome.text} é Maior de Idade!';
      }
      else {
        _textoResultado = '${_campoNome.text} é Menor de Idade!';
      }
    }
    setState(() { });
  }
}