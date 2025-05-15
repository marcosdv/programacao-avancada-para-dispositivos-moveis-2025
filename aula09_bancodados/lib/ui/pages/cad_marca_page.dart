import 'package:aula09_bancodados/extensions/string_extension.dart';
import 'package:aula09_bancodados/helpers/marca_helper.dart';
import 'package:aula09_bancodados/models/marca.dart';
import 'package:aula09_bancodados/ui/widgets/barra_titulo.dart';
import 'package:aula09_bancodados/ui/widgets/botao_quadrado.dart';
import 'package:aula09_bancodados/ui/widgets/campo_texto.dart';
import 'package:aula09_bancodados/ui/widgets/msg_alerta.dart';
import 'package:flutter/material.dart';

class CadMarcaPage extends StatefulWidget {
  const CadMarcaPage({super.key});
  
  @override
  State<CadMarcaPage> createState() => _CadMarcaPageState();
}

class _CadMarcaPageState extends State<CadMarcaPage> {
  final _codigoController = TextEditingController();
  final _nomeController = TextEditingController();
  final _marcaHelper = MarcaHelper();

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo.criar('Cadastro de Marca'),
        body: ListView(
          children: [
            CampoTexto(
              controller: _codigoController,
              texto: 'Código',
              teclado: TextInputType.numberWithOptions(decimal: false),
            ),
            CampoTexto(
              controller: _nomeController,
              texto: 'Nome',
            ),
            BotaoQuadrado(
              clique: _salvar,
              texto: 'Salvar',
              icone: Icons.save,
            ),
          ],
        ),
      ),
    );
  }

  void _salvar() async {
    if (_codigoController.text.toInt() <= 0) {
      MsgAlerta().show(
        context: context,
        titulo: 'Atenção',
        texto: 'O campo Código deve possuir um valor válido!'
      );
      return;
    }
    if (_nomeController.text.trim().isEmpty) {
      MsgAlerta().show(
          context: context,
          titulo: 'Atenção',
          texto: 'O campo Nome deve ser preenchido!'
      );
      return;
    }

    final marca = Marca(
      codigo: _codigoController.text.toInt(),
      nome: _nomeController.text
    );

    final result = await _marcaHelper.create(marca);

    if (result.isNotEmpty) {
      MsgAlerta().show(
        context: context,
        titulo: 'Atenção',
        texto: result
      );
    }
    else {
      Navigator.pop(context);
    }
  }
}