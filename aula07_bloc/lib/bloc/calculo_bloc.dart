import 'package:aula07_bloc/ui/widgets/mensagem_alerta.dart';
import 'package:flutter/widgets.dart';

class CalculoBloc {
  final BuildContext context;
  final gasolinaController = TextEditingController();
  final etanolController = TextEditingController();

  CalculoBloc(this.context);

  void calcular() {
    final valorGasolina = double.parse(gasolinaController.text);
    final valorEtanol = double.parse(etanolController.text);

    if (valorEtanol <= (valorGasolina * 0.7)) {
      MensagemAlerta().show(context, 'Etanol é melhor!');
    }
    else {
      MensagemAlerta().show(context, 'Gasolina é melhor!');
    }
  }
}