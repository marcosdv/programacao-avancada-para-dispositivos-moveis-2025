import 'package:aula03_etanol_gasolina/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _etanolController = TextEditingController();
  final _gasolinaController = TextEditingController();
  var _resultado = 'Resultado';

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Etanol x Gasolina'),
          backgroundColor: Colors.blue.shade200,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CampoTexto(_etanolController, 'Etanol'),
              CampoTexto(_gasolinaController, 'Gasolina'),
              ElevatedButton(onPressed: _calcular, child: Text('Calcular')),
              Text(_resultado),
            ],
          ),
        ),
      ),
    );
  }

  void _calcular() {
    if (_etanolController.text.isEmpty) {
      _resultado = 'Etanol sem valor!';
      return;
    }
    if (_gasolinaController.text.isEmpty) {
      _resultado = 'Gasolina sem valor!';
      return;
    }

    var valorEtanol = double.parse(_etanolController.text);
    var valorGasolina = double.parse(_gasolinaController.text);

    if (valorEtanol <= (valorGasolina * 0.7)) {
      _resultado = 'Etanol é Melhor!!!';
    }
    else {
      _resultado = 'Gasolina é Melhor!!!';
    }

    setState(() { });
  }
}