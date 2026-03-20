import 'package:flutter/material.dart';
import 'package:flutter_application_default/route_names.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  final String title;

  const Profile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile: $title',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          onPressed: () {
            // GoRouter.of(context).go('/dashboard');

            // context.go('/dashboard');

            // named
            context.goNamed(RouteNames.dashboard);
          },
          child: Text(
            'Go to dashboard',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
