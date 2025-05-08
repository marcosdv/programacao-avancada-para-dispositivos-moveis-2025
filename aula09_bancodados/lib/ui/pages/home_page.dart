import 'package:aula09_bancodados/helpers/marca_helper.dart';
import 'package:aula09_bancodados/models/marca.dart';
import 'package:aula09_bancodados/ui/widgets/barra_titulo.dart';
import 'package:aula09_bancodados/ui/widgets/botao_flutuante.dart';
import 'package:aula09_bancodados/ui/widgets/circulo_espera.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _marcaHelper = MarcaHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraTitulo.criar('Marcas'),
      floatingActionButton: BotaoFlutuante(
        evento: _abrirCadastroMarca,
        icone: Icons.add
      ),
      body: FutureBuilder(
        future: _marcaHelper.get(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CirculoEspera();
            default:
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Erro: ${snapshot.error}');
              }
              else {
                return _criarListaMarca(snapshot.data ?? []);
              }
          }
        }
      ),
    );
  }

  Widget _criarListaMarca(List<Marca> listaMarca) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: listaMarca.length,
      itemBuilder: (context, index) {
        return _criarItem(listaMarca[index]);
      }
    );
  }

  Widget _criarItem(Marca marca) {
    return GestureDetector(
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(marca.codigo.toString()),
            ),
            Expanded(child: Text(marca.nome)),
            Icon(Icons.arrow_forward_ios, size: 16)
          ],
        ),
      ),
    );
  }

  void _abrirCadastroMarca() {
    _marcaHelper.create(Marca(codigo: 2, nome: 'Outro Nome'));
  }
}