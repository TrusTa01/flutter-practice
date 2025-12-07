import 'package:flutter/material.dart';

class _Counter {
   final ValueNotifier<int> _count = ValueNotifier<int>(0);

   ValueNotifier<int> get count => _count;

   void increment() {
    _count.value++;
   }
}

void main() {
  runApp(
    MaterialApp(home: CounterScreen()));
}
    class CounterScreen extends StatelessWidget {
      final counter = _Counter();

      CounterScreen({super.key});

      @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: counter.count, 
          builder: (context, value, child) => Text('$value'),
          ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: counter.increment, child: const Icon(Icons.add),),
    );
  }
    }
