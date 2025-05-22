extension StringExtension on String {
  int toInt({int vlrPadrao = 0}) {
    return int.tryParse(this) ?? vlrPadrao;
  }

  /*
  DateTime toDateBr() {
    //pacote adicional: intl
    var format = DateFormat('dd/MM/yyyy');
    return format.parse(this);
  }
  */
}