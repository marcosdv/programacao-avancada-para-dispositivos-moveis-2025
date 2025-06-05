import 'package:flutter/material.dart';

class BarraTitulo extends StatelessWidget {
  const BarraTitulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColorDark,
            Theme.of(context).primaryColorLight,
          ]
        ),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 10)
        ],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(100),
          topLeft: Radius.circular(100),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.wallet, color: Colors.white, size: 70),
          Text('Minha Carteira',
            style: Theme.of(context).textTheme.headlineLarge)
        ],
      ),
    );
  }
}