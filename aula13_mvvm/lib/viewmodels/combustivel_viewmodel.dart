import 'package:aula13_mvvm/models/combustivel_model.dart';
import 'package:flutter/foundation.dart';

class CombustivelViewModel extends ChangeNotifier {
  final _model = CombustivelModel();

  String _gasolinaInput = '';
  String _etanolInput = '';
  String _msgErro = '';
  String? _resultado;

  String get gasolinaInput => _gasolinaInput;
  String get etanolInput => _etanolInput;
  String get msgErro => _msgErro;
  String? get resultado => _resultado;

  set gasolinaInput(String value) {
    _gasolinaInput = value;
    _limparMsg();
  }

  set etanolInput(String value) {
    _etanolInput = value;
    _limparMsg();
  }

  void _limparMsg() {
    _resultado = null;
    _msgErro = '';
    notifyListeners();
  }

  void calcular() {
    _msgErro = '';

    final double? gasolina = double.tryParse(_gasolinaInput);
    final double? etanol = double.tryParse(_etanolInput);

    if (gasolina == null) {
      _msgErro = 'Valor da gasolina inválido!';
      notifyListeners();
      return;
    }

    if (etanol == null) {
      _msgErro = 'Valor do etanol inválido!';
      notifyListeners();
      return;
    }

    _model.valorGasolina = gasolina;
    _model.valorEtanol = etanol;

    _resultado = _model.calcular();
    notifyListeners();
  }
}