import 'package:aula13_mvvm/config.dart';
import 'package:aula13_mvvm/viewmodels/combustivel_viewmodel.dart';
import 'package:aula13_mvvm/views/combustivel_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CombustivelViewModel(),
        ),
      ],
      child: MaterialApp(
        title: Config.TituloApp,
        home: CombustivelView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}