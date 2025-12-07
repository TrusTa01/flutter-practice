import 'package:flutter/material.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        fontFamily: 'Bitcount Grid Single',
      ),
      home: const MyHomePage(title: ':3'),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  int _counter = 0;

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
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/snezha.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text('1'), Text('4'), Text('7')],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text('2'), Text('5'), Text('8')],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text('3'), Text('6'), Text('9')],
                  ),
                ],
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                fontFamily: 'Bitcount Grid Single',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),
            Text(
              '$_counter',
              style: TextStyle(
                fontFamily: 'Bitcount Grid Single',
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}