import 'dart:convert';
import 'package:aula09_bancodados/models/marca.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarcaHelper {
  static const String _key = 'marca_';

  //GET - SELECT
  Future<List<Marca>> get() async {
    try {
      final shared = await SharedPreferences.getInstance();

      final listaJson = shared.getStringList(_key);

      if (listaJson == null || listaJson.isEmpty) {
        print('Marcas nao encontradas no Shared');
        return [];
      }

      final listaMarca = listaJson
          .map((json) => Marca.fromJson(jsonDecode(json)));

      return listaMarca.toList();
    }
    catch (e) {
      print('Erro ao buscar as marcas: $e');
      return [];
    }
  }

  //SALVAR JSON MARCAS
  Future<void> _save(List<Marca> lista) async {
    try {
      final shared = await SharedPreferences.getInstance();
      
      final listaJson = lista
        .map((marca) => jsonEncode(marca.toJson()))
        .toList();

      await shared.setStringList(_key, listaJson);
    }
    catch (e) {
      print('Erro ao salvar as marcas: $e');
    }
  }

  //INSERIR - INSERT
  Future<String> create(Marca marca) async {
    try {
      final listaAtual = await get();

      if (listaAtual.any((m) => m.codigo == marca.codigo)) {
        return 'Marca com o código já existente!';
      }

      listaAtual.add(marca);

      await _save(listaAtual);
      return '';
    }
    catch (e) {
      return 'Erro ao criar a marca: ${e.toString()}';
    }
  }

  //ATUALIZAR - UPDATE
  Future<String> update(Marca marca) async {
    try {
      final listaAtual = await get();

      final indice = listaAtual
        .indexWhere((m) => m.codigo == marca.codigo);

      if (indice >= 0) {
        listaAtual[indice] = marca;

        await _save(listaAtual);
        return '';
      }
      return 'Marca não encontrada para atualizar!';
    }
    catch (e) {
      return 'Erro ao atualizar a marca: ${e.toString()}';
    }
  }

  //EXCLUIR - DELETE
  Future<String> delete(int codigo) async {
    try {
      final listaAtual = await get();

      listaAtual.removeWhere((m) => m.codigo == codigo);

      await _save(listaAtual);
      return '';
    }
    catch (e) {
      return 'Erro ao excluir a marca: ${e.toString()}';
    }
  }
}