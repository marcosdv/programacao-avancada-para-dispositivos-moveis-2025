import 'package:aula04_pokedex/models/pokemon.dart';
import 'package:aula04_pokedex/ui/widgets/barra_titulo.dart';
import 'package:aula04_pokedex/ui/widgets/imagem_web.dart';
import 'package:flutter/material.dart';

class PokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonPage(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo().criar(pokemon.nome),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('#${pokemon.numero} - ${pokemon.nome}'),
              ImagemWeb(link: pokemon.getImagem()),
            ],
          ),
        ),
      ),
    );
  }
}