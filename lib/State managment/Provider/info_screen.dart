
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    var a = Provider.of<int>(context).toString();

    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Экран информации'),
            Text(a),
          ],
        ),
      )),
    );
  }

}