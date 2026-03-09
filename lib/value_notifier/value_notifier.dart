import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Value notifier',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider(
        create: (context) => MyValueProvider(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Value notifier'), centerTitle: true),
      body: ListView(
        children: [
          Consumer(builder: (context, value, child) => AppRootWidget()),
        ],
      ),
    );
  }
}

class AppRootWidget extends StatelessWidget {
  const AppRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MyValueProvider>();

    return Card(
      elevation: 4,
      child: Column(
        children: [
          Text(
            '(Root widget)',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            '${provider.counterValue}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Counter(), Counter()],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MyValueProvider>();

    return Card(
      margin: EdgeInsets.all(4).copyWith(bottom: 32),
      color: Colors.yellowAccent,
      child: Column(
        children: [
          Text('(Child Widget)'),
          Text(
            '${provider.counterValue}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          OverflowBar(
            children: [
              IconButton(
                onPressed: () => provider._decrementCounter(),
                color: Colors.red,
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => provider._incrementCounter(),
                color: Colors.green,
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyValueProvider extends ValueNotifier {
  MyValueProvider() : super(0);

  int get counterValue => value;

  void _incrementCounter() => value++;

  void _decrementCounter() => value--;
}
