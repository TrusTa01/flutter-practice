import 'package:flutter/material.dart';
import 'package:flutter_application_default/Navigation/Imperative/Navigator/detail_screen.dart';

void main() {
  runApp(MaterialApp(home: _HomeScreen()));
}

class _HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text('Главный экран'),
    ),
    body: Center(
      child: ElevatedButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen()),
        );
      }, 
      child: Text('Переход на след страницу')
      ),
    ),
   );
  }
}