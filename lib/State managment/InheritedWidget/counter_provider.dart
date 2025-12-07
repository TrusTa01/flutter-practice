import 'package:flutter/material.dart';
import 'counter.dart';

class CounterProvider extends InheritedWidget {
  final Counter counter;
  final VoidCallback incrementFunction;
  final VoidCallback decrementFunction;

  const CounterProvider({
    super.key,
    required super.child,
    required this.counter,
    required this.incrementFunction,
    required this.decrementFunction,
  });

  void increment() {
    incrementFunction();
  }

  void decrement() {
    decrementFunction();
  }

  @override
 bool updateShouldNotify(covariant CounterProvider oldWidget) {
  return counter.value != oldWidget.counter.value;
 }

 static CounterProvider of(BuildContext context) {
  final provider = context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  assert(provider != null, 'CounterProvider не найден');
  return provider!;
 }
}
