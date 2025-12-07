import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

void main() {
  runApp(MaterialApp(home: CounterScreen(counter: Counter()),));
}

class CounterScreen extends StatelessWidget{
  final Counter counter;

  const CounterScreen({super.key, required this.counter});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(animation: counter, builder: (context, child) => Text('${counter.count}'),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: counter.increment, child: Icon(Icons.add),),
    );
  }
}