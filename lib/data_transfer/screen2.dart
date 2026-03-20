import 'package:flutter/material.dart';
import 'package:flutter_application_default/data_transfer/test_data.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(args == null ? 'No data' : (args as TestData).data),
      ),
    );
  }
}
