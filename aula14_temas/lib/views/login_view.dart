import 'package:aula14_temas/views/home_view.dart';
import 'package:aula14_temas/views/widgets/barra_titulo.dart';
import 'package:aula14_temas/views/widgets/botao_quadrado.dart';
import 'package:aula14_temas/views/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        body: ListView(
          children: [
            BarraTitulo(),
            Text('LOGIN',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            CampoTexto(),
            CampoTexto(),
            BotaoQuadrado(
              texto: 'Entrar',
              clique: () { _login(context); }
            )
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => HomeView()));
  }
}