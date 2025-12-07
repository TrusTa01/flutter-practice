import 'package:flutter/material.dart';
import 'package:flutter_application_default/Form/register_form_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Register Form',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.comfortable,
    ),
    home: RegisterFormPage(),
   );
  }
}