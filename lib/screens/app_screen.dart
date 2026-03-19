import 'package:flutter/material.dart';
import 'package:flutter_application_default/extensions/context_ext.dart';

class DemoAppScreen extends StatefulWidget {
  final VoidCallback onLocaleToggle;

  DemoAppScreen({super.key, required this.onLocaleToggle});

  @override
  _DemoAppScreenState createState() => _DemoAppScreenState();
}

class _DemoAppScreenState extends State<DemoAppScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(child: Text(l10n.appTitle));
  }
}
