import 'package:aula13_mvvm/config.dart';
import 'package:aula13_mvvm/viewmodels/combustivel_viewmodel.dart';
import 'package:aula13_mvvm/views/widgets/campo_texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CombustivelView extends StatelessWidget {
  const CombustivelView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CombustivelViewModel>();

    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Config.TituloApp),
          centerTitle: true,
          backgroundColor: Config.corPricipal,
          foregroundColor: Config.corTexto,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CampoTexto(
                texto: 'Gasolina',
                evento: (value) => viewModel.gasolinaInput = value
              ),
              CampoTexto(
                texto: 'Etanol',
                evento: (value) => viewModel.etanolInput = value
              ),

              SizedBox(height: 22),

              ElevatedButton(
                onPressed: viewModel.calcular,
                child: Text('Calcular')
              ),

              SizedBox(height: 44),

              if (viewModel.resultado != null)
                Column(
                  children: [
                    Text('Melhor abastecer com',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(viewModel.resultado!,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),

              if (viewModel.msgErro.isNotEmpty)
                Text(
                  viewModel.msgErro,
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
            ],
          ),
        ),
      ),
    );
  }
}