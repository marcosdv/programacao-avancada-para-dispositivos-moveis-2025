import 'package:aula07_bloc/bloc/calculo_bloc.dart';
import 'package:aula07_bloc/config.dart';
import 'package:aula07_bloc/ui/ios/widgets/campo_texto.dart';
import 'package:flutter/cupertino.dart';

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
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(Config.tituloApp),
        ),
        child: Column(
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
            CupertinoButton(
              child: Text('Calcular'),
              onPressed: calcBloc.calcular
            ),
          ],
        )
      ),
    );
  }
}
