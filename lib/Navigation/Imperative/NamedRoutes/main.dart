import 'package:flutter/material.dart';
import 'package:flutter_application_default/Navigation/Imperative/NamedRoutes/app_routes_name.dart';
import 'package:flutter_application_default/Navigation/Imperative/NamedRoutes/screens/default_screen.dart';
import 'package:flutter_application_default/Navigation/Imperative/NamedRoutes/screens/home_screen.dart';
import 'package:flutter_application_default/Navigation/Imperative/NamedRoutes/screens/login_screen.dart';
import 'package:flutter_application_default/Navigation/Imperative/NamedRoutes/screens/main_screen.dart';
import 'package:flutter_application_default/Navigation/Imperative/NamedRoutes/screens/profile_screen.dart';
import 'package:flutter_application_default/Navigation/Imperative/NamedRoutes/screens/test_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      AppRoutesName.main: (context) => const MainScreen(),
      AppRoutesName.profile: (context) => const ProfileScreen(),
      AppRoutesName.login: (context) => const LoginScreen(),
      AppRoutesName.home: (context) => const HomeScreen(),
    },
    onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => const DefaultScreen()),
    onGenerateRoute: (settings) {
       if (settings.name == '/test') {
      return MaterialPageRoute(builder: (context) => const TestScreen());
    } return null;
    },
   
  ));
}