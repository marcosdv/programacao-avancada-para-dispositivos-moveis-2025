import 'package:flutter/material.dart';

class BarraTitulo {
  PreferredSizeWidget criar(String titulo) {
    return AppBar(
      title: Text(titulo),
      backgroundColor: Colors.red.shade700,
      foregroundColor: Color(0xFFFFFFFF),
      centerTitle: true,
    );
  }
}