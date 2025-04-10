import 'package:aula07_bloc/bloc/calculo_bloc.dart';
import 'package:aula07_bloc/config.dart';
import 'package:aula07_bloc/ui/android/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final calcBloc = CalculoBloc(context);

    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Config.tituloApp),
          centerTitle: true,
          backgroundColor: Colors.lightGreen.shade400,
        ),
        body: Column(
          children: [
            CampoTexto(
              calcBloc.gasolinaController,
              'Gasolina',
              TextInputType.number
            ),
            CampoTexto(
              calcBloc.etanolController,
              'Etanol',
              TextInputType.number
            ),
            ElevatedButton(
              onPressed: calcBloc.calcular,
              child: Text('Calcular')
            ),
          ],
        ),
      ),
    );
  }
}
