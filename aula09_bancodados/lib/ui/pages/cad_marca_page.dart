import 'package:aula09_bancodados/ui/widgets/barra_titulo.dart';
import 'package:flutter/material.dart';

class CadMarcaPage extends StatefulWidget {
  const CadMarcaPage({super.key});
  
  @override
  State<CadMarcaPage> createState() => _CadMarcaPageState();
}

class _CadMarcaPageState extends State<CadMarcaPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo.criar('Cadastro de Marca'),
      ),
    );
  }
}
