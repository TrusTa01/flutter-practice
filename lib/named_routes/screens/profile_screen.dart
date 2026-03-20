import 'package:flutter/material.dart';
import 'package:flutter_application_default/named_routes/app_routes_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProfileScreen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutesName.home);
          },
          child: Text('Переход на HomeScreen'),
        ),
      ),
    );
  }
}
