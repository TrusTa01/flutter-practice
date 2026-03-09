import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Check out other branches for specific topics!\n'
            'Use: git checkout topic/name',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}
