import 'package:aula09_bancodados/extensions/string_extension.dart';
import 'package:aula09_bancodados/helpers/marca_helper.dart';
import 'package:aula09_bancodados/models/marca.dart';
import 'package:aula09_bancodados/ui/widgets/barra_titulo.dart';
import 'package:aula09_bancodados/ui/widgets/botao_quadrado.dart';
import 'package:aula09_bancodados/ui/widgets/campo_texto.dart';
import 'package:aula09_bancodados/ui/widgets/msg_alerta.dart';
import 'package:flutter/material.dart';

class CadMarcaPage extends StatefulWidget {
  final Marca? marca;

  const CadMarcaPage({this.marca, super.key});
  
  @override
  State<CadMarcaPage> createState() => _CadMarcaPageState();
}

class _CadMarcaPageState extends State<CadMarcaPage> {
  final _codigoController = TextEditingController();
  final _nomeController = TextEditingController();
  final _marcaHelper = MarcaHelper();
  var isInclusao = true;

  @override
  void initState() {
    super.initState();
    isInclusao = widget.marca == null;
    _codigoController.text = widget.marca?.codigo.toString() ?? "";
    _nomeController.text = widget.marca?.nome ?? "";
  }

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
              isHabilitado: isInclusao,
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
            _criarBotaoExcluir(),
          ],
        ),
      ),
    );
  }

  Widget _criarBotaoExcluir() {
    if (isInclusao) {
      return SizedBox();
    }

    return BotaoQuadrado(
      clique: _excluir,
      texto: 'Excluir',
      icone: Icons.delete_forever,
    );
  }

  void _excluir() {
    MsgAlerta().show(
      context: context,
      titulo: 'Atenção',
      texto: 'Deseja excluir essa Marca?',
      botoes: [
        TextButton(
          onPressed: _confirmarExcluir,
          child: Text('Sim')
        ),
        TextButton(
          onPressed: () { Navigator.pop(context); },
          child: Text('Não')
        ),
      ]
    );
  }

  void _confirmarExcluir() async {
    if (!isInclusao) {
      _marcaHelper.delete(widget.marca?.codigo ?? 0);
    }
    Navigator.pop(context); //1 - Fecha a mensagem
    Navigator.pop(context); //2 - Fecha a tela
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

    final result = (isInclusao)
        ? await _marcaHelper.create(marca)
        : await _marcaHelper.update(marca);

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