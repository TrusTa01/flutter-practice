import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(),
      home: const HomePage(title: 'Counter'),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<HomePage> {
  int _counter = 50;

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 116, 197, 252),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tap "-" to decrement',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Container(
              width: 150,
              height: 70,

              margin: .all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 190, 176, 255),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _decrementCounter,
                    icon: Icon(Icons.remove, size: 25, color: Colors.black),
                  ),
                  Text(
                    '$_counter',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: _incrementCounter,
                    icon: Icon(Icons.add, size: 25, color: Colors.black),
                  ),
                ],
              ),
            ),
            Text(
              'Tap "+" to increment',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
