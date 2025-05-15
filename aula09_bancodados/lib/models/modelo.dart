import 'package:aula09_bancodados/extensions/string_extension.dart';
import 'package:aula09_bancodados/models/marca.dart';

class Modelo {
  int codigo;
  String nome;
  Marca marca;

  Modelo({
    required this.codigo,
    required this.nome,
    required this.marca
  });

  factory Modelo.fromJson(Map json) {
    return Modelo(
      codigo: json['codigo'].toString().toInt(),
      nome: json['nome'],
      marca: Marca.fromJson(json['marca'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'nome': nome,
      'marca': marca.toJson()
    };
  }
}