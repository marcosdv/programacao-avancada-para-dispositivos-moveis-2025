import 'package:flutter/material.dart';

class BarraTitulo {
  PreferredSizeWidget criar(String titulo, {List<Widget>? acoes}) {
    return AppBar(
      title: Text(titulo),
      backgroundColor: Color(0xFFFA6F3E),
      centerTitle: true,
      actions: acoes,
    );
  }
}