import 'package:flutter/material.dart';
import 'counter.dart';
import 'counter_provider.dart';

class CounterEmbedder extends StatefulWidget {
  final Widget child;
  final Counter counter;

  const CounterEmbedder({
    super.key,
    required this.counter,
    required this.child,
  });

  @override
  State<CounterEmbedder> createState() => _CounterEmbedderState();
}

class _CounterEmbedderState extends State<CounterEmbedder> {
  late Counter counter;
  @override
  void initState() {
    super.initState();
    counter = widget.counter;
  }

  void increment() {
    setState(() {
      counter.increment();
    });
  }

  void decrement() {
    setState(() {
      counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: counter.copyWith(),
      incrementFunction: increment,
      decrementFunction: decrement,
      child: widget.child,
    );
  }
}
