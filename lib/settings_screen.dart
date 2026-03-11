import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'info_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var b = Provider.of<List<String>>(context);
    
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Экран настроек'),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => InfoScreen()
                      ),
                  );
                },
               child: Text('Информация')
               ),
               SizedBox(height: 20,),
               Text(b[1]),
            ],
          ),
        ),
      ),
    );
  }
}
