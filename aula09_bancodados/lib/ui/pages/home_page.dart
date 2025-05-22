import 'package:aula09_bancodados/helpers/marca_helper.dart';
import 'package:aula09_bancodados/models/marca.dart';
import 'package:aula09_bancodados/ui/pages/cad_marca_page.dart';
import 'package:aula09_bancodados/ui/widgets/barra_titulo.dart';
import 'package:aula09_bancodados/ui/widgets/botao_flutuante.dart';
import 'package:aula09_bancodados/ui/widgets/circulo_espera.dart';
import 'package:aula09_bancodados/ui/widgets/msg_alerta.dart';
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
        return Dismissible(
          key: UniqueKey(),
          child: _criarItem(listaMarca[index]),
          background: Container(
            color: Colors.amber,
            child: Row(
              children: [
                Icon(Icons.edit),
                Text('Editar'),
              ],
            ),
          ),
          secondaryBackground: Container(
            color: Colors.redAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Excluir'),
                Icon(Icons.delete_forever),
              ],
            ),
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              _marcaHelper.delete(listaMarca[index].codigo);
            }
            else {
              _abrirCadastroMarca(marca: listaMarca[index]);
            }
          },
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              return await MsgAlerta().show(
                context: context,
                titulo: 'Atenção',
                texto: 'Deseja excluir a marca: ${listaMarca[index].nome}',
                botoes: [
                  TextButton(
                    onPressed: () { Navigator.of(context).pop(true); },
                    child: Text('Sim')
                  ),
                  TextButton(
                    onPressed: () { Navigator.of(context).pop(false); },
                    child: Text('Não')
                  ),
                ]
              );
            }

            return true;
          },
        );
      }
    );
  }

  Widget _criarItem(Marca marca) {
    return GestureDetector(
      onTap: () { /* Abrir a tela de listagem de modelos */ },
      onLongPress: () { _abrirCadastroMarca(marca: marca); },
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

  void _abrirCadastroMarca({Marca? marca}) async {
    await Navigator.push(context, MaterialPageRoute(
      builder: (_) => CadMarcaPage(marca: marca)));

    setState(() { });
  }
}