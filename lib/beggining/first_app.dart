import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 67, 70, 245),
        appBar: AppBar(
          title: Text('My first App'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 77, 177, 216),
        ),
        body: Center(
          child: Text(
            'My home page',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
