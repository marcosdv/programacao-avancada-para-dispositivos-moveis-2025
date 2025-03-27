import 'package:aula04_pokedex/config.dart';
import 'package:aula04_pokedex/infra/cliente_http.dart';
import 'package:aula04_pokedex/models/pokemon.dart';

class PokemonRemote {
  final _clientHttp = ClienteHttp();

  PokemonRemote();

  Future<List<Pokemon>> get() async {
    final lista = await _clientHttp.getJson(linkAPI, tagJson: 'pokemon');

    await Future.delayed(Duration(seconds: 3));

    return lista.map((e) => Pokemon.fromMap(e)).toList();
  }
}