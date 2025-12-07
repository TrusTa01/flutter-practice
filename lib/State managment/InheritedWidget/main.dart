import 'package:flutter/material.dart';
import 'counter.dart';
import 'counter_provider.dart';
import 'counter_di.dart';

void main() => runApp(
  CounterEmbedder(
    counter: Counter(5),
    child: const MaterialApp(home: _CounterScreen()),
  ),
);

class _CounterScreen extends StatefulWidget {
  const _CounterScreen();

  @override
  State<_CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<_CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Пример InheritedWidget')),
      body: const _CounterView(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: provider.increment,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: provider.decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context) {
    final counter = CounterProvider.of(context).counter;
    return Center(
      child: Text('${counter.value}', style: TextStyle(fontSize: 48)),
    );
  }
}
