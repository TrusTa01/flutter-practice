import 'package:flutter/material.dart';
import 'package:flutter_application_default/provider/main.dart';
import 'package:flutter_application_default/provider/settings_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var temp = Provider.of<Temperature>(context);
    // ИЛИ
    // var temp = context.watch<Temperature>();
    // var tempPlus = Provider.of<Temperature>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Главный экран'),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => SettingsScreen(),
                    ),
                  );
                },
                child: Text('Настройки'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  //  context.watch<Temperature>().plusTemp();
                  // ИЛИ
                  Provider.of<Temperature>(context, listen: false).plusTemp();
                },
                child: Text('Прибавить температуру'),
              ),
              Text(temp.temperature.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
