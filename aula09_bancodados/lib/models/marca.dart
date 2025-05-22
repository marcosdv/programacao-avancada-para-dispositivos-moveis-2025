import 'package:aula09_bancodados/extensions/string_extension.dart';

class Marca {
  int codigo;
  String nome;

  Marca({required this.codigo, required this.nome});

  factory Marca.fromJson(Map json) {
    return Marca(
      codigo: json['codigo'].toString().toInt(),
      nome: json['nome']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'nome': nome
    };
  }
}