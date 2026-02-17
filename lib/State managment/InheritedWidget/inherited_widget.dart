import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited widget',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Inherited widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() => setState(() => _counter++);
  void _decrementCounter() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inherited widget'), centerTitle: true),
      body: ListView(
        children: [MyInheritedWidget(child: AppRootWidget(), myState: this)],
      ),
    );
  }
}

class AppRootWidget extends StatelessWidget {
  const AppRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheritedWidget.of(context).myState;

    return Card(
      elevation: 4,
      child: Column(
        children: [
          Text(
            '(Root widget)',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            '${rootWidgetState.counterValue}',
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
    final rootWidgetState = MyInheritedWidget.of(context).myState;

    return Card(
      margin: EdgeInsets.all(4).copyWith(bottom: 32),
      color: Colors.yellowAccent,
      child: Column(
        children: [
          Text('(Child Widget)'),
          Text(
            '${rootWidgetState.counterValue}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          OverflowBar(
            children: [
              IconButton(
                onPressed: () => rootWidgetState._decrementCounter(),
                color: Colors.red,
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => rootWidgetState._incrementCounter(),
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

class MyInheritedWidget extends InheritedWidget {
  final _MyHomePageState myState;

  MyInheritedWidget({super.key, required super.child, required this.myState});

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return this.myState.counterValue != oldWidget.myState.counterValue;
  }

  static MyInheritedWidget of(BuildContext context) {
    final MyInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType();
    assert(result != null, 'No MyInheritedWidget found in context');
    return result!;
  }
}
