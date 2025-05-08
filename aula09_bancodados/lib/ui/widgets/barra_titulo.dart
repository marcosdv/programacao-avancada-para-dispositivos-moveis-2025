import 'package:flutter/material.dart';

class BarraTitulo {
  static PreferredSizeWidget criar(String titulo) {
    return AppBar(
      title: Text(titulo),
      centerTitle: true,
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
    );
  }
}