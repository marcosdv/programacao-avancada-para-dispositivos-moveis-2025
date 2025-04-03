import 'package:aula04_pokedex/datasources/remote/pokemon_remote.dart';
import 'package:aula04_pokedex/models/pokemon.dart';
import 'package:aula04_pokedex/ui/pages/pokemon_page.dart';
import 'package:aula04_pokedex/ui/pages/sobre_page.dart';
import 'package:aula04_pokedex/ui/widgets/barra_titulo.dart';
import 'package:aula04_pokedex/ui/widgets/circulo_espera.dart';
import 'package:aula04_pokedex/ui/widgets/imagem_web.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo().criar('Pokedex', acoes: [
          IconButton(
            onPressed: _abrirSobre,
            icon: Icon(Icons.help_outline, size: 32)
          ),
        ]),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFFA6F3E)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.directions_walk, size: 80,),
                        Icon(Icons.catching_pokemon, size: 20),
                        Icon(Icons.adb_sharp, size: 50),
                      ],
                    ),
                    Text('Pokedex'),
                  ],
                )
              ),
              ListTile(
                title: Text('Sobre'),
                subtitle: Text('Sobre a Pokedex'),
                leading: Icon(Icons.help_outline),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: _abrirSobre,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: PokemonRemote().get(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return CirculoEspera();
                    default:
                      return _criarLista(context, snapshot.data ?? []);
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _criarLista(BuildContext context, List<Pokemon> dados) {
    return ListView.builder(
      itemCount: dados.length,
      padding: EdgeInsets.all(12),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) => PokemonPage(dados[index]))
            );
          },
          child: _criarItem(dados[index]),
        );
      }
    );
  }

  Widget _criarItem(Pokemon pokemon) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Row(
            children: [
              ImagemWeb(
                link: pokemon.getImagem(),
                h: 75,
                w: 75,
              ),
              Expanded(
                child: Text(pokemon.nome, style: TextStyle(fontSize: 24)),
              ),
              Icon(Icons.arrow_forward_ios, size: 16)
            ],
          ),
        ),
      ),
    );
  }

  void _abrirSobre() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SobrePage())
    );
  }
}