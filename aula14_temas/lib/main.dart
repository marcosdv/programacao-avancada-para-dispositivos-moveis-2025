import 'package:aula14_temas/meu_tema.dart';
import 'package:aula14_temas/views/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: meuTema(),
    title: 'App de Temas',
    home: LoginView(),
    debugShowCheckedModeBanner: false,
  ));
}