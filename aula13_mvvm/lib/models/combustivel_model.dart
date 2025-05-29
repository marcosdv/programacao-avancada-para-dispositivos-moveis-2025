class CombustivelModel {
  late double valorGasolina;
  late double valorEtanol;

  String calcular() {
    if (valorEtanol <= (valorGasolina * 0.7)) {
      return 'Etanol';
    }

    return 'Gasolina';
  }
}