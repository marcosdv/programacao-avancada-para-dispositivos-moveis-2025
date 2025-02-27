import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.car_rental, color: Colors.white),
              Text('Aula 02', style: TextStyle(color: Colors.white))
            ],
          ),
          centerTitle: true,
          //backgroundColor: Colors.blue.shade900
          //backgroundColor: Color(0xFF0000FF),
          //backgroundColor: Color.fromRGBO(0, 0, 255, 1),
          backgroundColor: Color.fromARGB(255, 0, 0, 255),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('OK'),
        ),
        body: Column(
          children: [
            Text('Relou Uordi'),
            Text('Sejam bem Vindos'),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Valor',
                  prefixIcon: Icon(Icons.monetization_on_outlined)
                ),
              ),
            ),
                        
            ElevatedButton(onPressed: () {}, child: Text('OK'))
          ],
        ),
      ),
    );
  }
}