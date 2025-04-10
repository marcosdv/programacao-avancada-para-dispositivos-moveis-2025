import 'package:aula07_bloc/config.dart';
import 'package:flutter/cupertino.dart';

import '../ui/ios/home_page.dart';

class IosApp extends StatelessWidget {
  const IosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: Config.tituloApp,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
