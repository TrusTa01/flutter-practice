import 'package:flutter/material.dart';
import 'package:flutter_application_default/route_names.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          onPressed: () {
            // GoRouter.of(context).go('/profile');

            // Params transfer
            // String title = 'Some title';
            // context.go('/profile/${Uri.encodeComponent(title)}');

            // named
            context.goNamed(
              RouteNames.profile, 
              pathParameters: {'title': 'Some title'}
              // queryParameters: {'title' : 'Some title'}
            );
          },
          child: Text(
            'Go to profile',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
