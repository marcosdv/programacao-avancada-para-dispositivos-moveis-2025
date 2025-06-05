import 'package:flutter/material.dart';

ThemeData meuTema() {
  const corPrimaria = Color(0xFF5B129F);
  const corPrimariaEscura = Color(0xFF23004E);
  const corPrimariaClara = Color(0xFF7F3FFF);
  const corTextoClara = Color(0xFFFFFFFF);
  const corTextEscuro = Color(0xFF000000);

  const appBarTema = AppBarTheme(
    color: corPrimariaEscura,
    titleTextStyle: TextStyle(
      color: corTextoClara,
      fontSize: 20
    ),
    centerTitle: true
  );

  final botaoQuadradoTema = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(corPrimariaEscura),
      foregroundColor: WidgetStateProperty.all(corTextoClara),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      )),
    )
  );

  final campoTextoTema = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: corPrimariaEscura),
      borderRadius: BorderRadius.circular(20)
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: corPrimariaClara, width: 2),
      borderRadius: BorderRadius.circular(20)
    ),
  );

  const textoTema = TextTheme(
    titleLarge: TextStyle(
      color: corPrimariaEscura,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      fontSize: 30,
      color: corTextoClara
    ),
  );

  return ThemeData(
    primaryColor: corPrimaria,
    primaryColorDark: corPrimariaEscura,
    primaryColorLight: corPrimariaClara,
    appBarTheme: appBarTema,
    elevatedButtonTheme: botaoQuadradoTema,
    inputDecorationTheme: campoTextoTema,
    textTheme: textoTema
  );
}