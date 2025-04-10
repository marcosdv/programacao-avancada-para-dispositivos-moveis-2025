import 'package:aula07_bloc/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MensagemAlerta {
  void show(BuildContext context, String texto) {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: Text(Config.tituloApp),
        content: Text(texto),
        actions: [
          _criarOk(context),
        ],
      ),
    );
  }

  Widget _criarOk(BuildContext context) {
    final tema = Theme.of(context);
    if (tema.platform == TargetPlatform.iOS ||
        tema.platform == TargetPlatform.macOS) {
      return CupertinoDialogAction(
        onPressed: () => Navigator.pop(context),
        child: Text('Ok'),
      );
    }
    else {
      return TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text('Ok')
      );
    }
  }
}