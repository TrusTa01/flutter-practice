import 'package:flutter/material.dart';
import 'package:flutter_application_default/named_routes/app_routes_name.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MainScreen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutesName.profile);
              },
              child: Text('Переход на ProfileScreen'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/unknown');
              },
              child: Text('Переход на неизвестный маршрут'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/test');
              },
              child: Text('Переход на тестовый маршрут'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/test', arguments: true);
              },
              child: Text('Переход на тестовый маршрут с аргументами'),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
