import 'package:flutter/material.dart';

final List<String> buttons = [
  'AC',
  '( )',
  '%',
  '/',
  '7',
  '8',
  '9',
  'x',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '0',
  ',',
  '--',
  '=',
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My first calculator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        iconTheme: IconThemeData(color: Colors.grey),
      ),

      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String output = '';

  String expression = '';

  void _onPressedButton(String label) {
    setState(() {
      if (label == 'AC') {
        output = '';
        expression = '';
      } else if ([
        '0',
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        ',',
      ].contains(label)) {
        if (output == '0' && label != ',') {
          output = label;
        } else if (label == ',' && output.contains(',')) {
        } else {
          output = output + label;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.history)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),

      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Дисплей занимает 1/3 экрана (flex: 1)
          Expanded(
            flex: 1,
            child: _buildDisplay(), // <-- Вставляем дисплей
          ),

          // Кнопки занимают 2/3 экрана (flex: 2)
          Expanded(
            flex: 2,
            child: _buildButtons(), // <-- Вставляем кнопки
          ),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: const Color.fromARGB(255, 255, 255, 255),
      alignment: Alignment.bottomRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            expression,
            style: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(179, 0, 0, 0),
            ),
          ),
          Text(
            output,
            style: const TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),

      itemCount: buttons.length,

      itemBuilder: (BuildContext context, int index) {
        final label = buttons[index];
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[300],
            shape: CircleBorder(),
          ),
          child: Text(
            label,
            style: TextStyle(fontSize: 38, color: Colors.black),
          ),
          onPressed: () => _onPressedButton(label),
        );
      },
    );
  }
}
