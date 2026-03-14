import 'package:flutter/material.dart';

class DemoAppScreen extends StatefulWidget {
  final VoidCallback onLocaleToggle;

  DemoAppScreen({super.key, required this.onLocaleToggle});

  @override
  _DemoAppScreenState createState() => _DemoAppScreenState();
}

class _DemoAppScreenState extends State<DemoAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Localization practice'));
  }
}
