import 'package:aula07_bloc/config.dart';
import 'package:flutter/material.dart';

import '../ui/android/home_page.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.tituloApp,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
