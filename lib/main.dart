import 'package:flutter/material.dart';
import 'package:flutter_application_default/dashboard.dart';
import 'package:flutter_application_default/error_page.dart';
import 'package:flutter_application_default/profile.dart';
import 'package:flutter_application_default/route_names.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

final bool isLoggedIn = true;

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => const ErrorPage(),
    redirect: (context, state) => isLoggedIn ? '/dashboard' : '/profile',
    initialLocation: '/profile/Some%20title',
    routes: [
      GoRoute(
        name: RouteNames.dashboard,
        path: '/dashboard',
        builder: (context, state) => const Dashboard(),
      ),
      // Параметры: все параметры должны совпадать (в данном случае name)
      GoRoute(
        name: RouteNames.profile,
        path: '/profile/:title',
        builder: (context, state) =>
            Profile(title: state.pathParameters['title']!),
      ),

      // child routes
      // GoRoute(
      //   path: '/dashboard',
      //   builder: (context, state) => const Dashboard(),
      //   routes: [
      //     GoRoute(
      //       path: 'profile',
      //       builder: (context, state) => const Profile(),
      //     ),
      //   ],
      // ),
    ],
  );
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Go Router Demo', routerConfig: _router);
  }
}
