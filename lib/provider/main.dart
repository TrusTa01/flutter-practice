import 'package:flutter/material.dart';
import 'package:flutter_application_default/provider/home_screen.dart';
import 'package:provider/provider.dart';

class Temperature extends ChangeNotifier {
  int temperature = 20;

  void plusTemp() {
    temperature++;
    notifyListeners();
  }
}

void main() {
  int a = 1;
  List<String> b = ['1', '2'];
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => a),
        Provider(create: (context) => b),
        ChangeNotifierProvider(create: (context) => Temperature()),
        // ListenableProvider - только без автоматического dispose
        // StreamProvider и FututeProvider
        // ProxyProvider - провайдер с {}, соединяет провайдеры и может производить манипулиции с ними
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}
