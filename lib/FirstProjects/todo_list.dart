import 'package:flutter/material.dart';

List<String> tasks = [];


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todo app',
      theme: ThemeData(primarySwatch: Colors.blue),
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
  final textController = TextEditingController();


  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void _addNewTask() {
    if (textController.text.isEmpty) {
      // ignore: avoid_print
      print('Текст пустой');
      return;
    }
    setState(() {
      tasks.add(textController.text);
    });

    Navigator.of(context).pop();
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To Do List'), centerTitle: true),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Добавить задачу'),
          content: TextFormField(
            controller: textController,
            decoration: InputDecoration(
              labelText: 'Введите новую задачу',
              border: OutlineInputBorder(),
            ),
            maxLines: 2,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: _addNewTask,
              child: Text('Сохранить'),
            ),
          ],
        );
      },
    );
  },
  backgroundColor: const Color.fromARGB(255, 128, 178, 220),
  child: Icon(Icons.add),
),
    );
  }

  Widget _buildBody() {
  return Column(
      children: [
        if (tasks.isEmpty) 
          Expanded(child: Center(child: Text('Нет задач')))
        else 
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return _task(tasks[index], index);
              },
            ),
          ),
      ],
  );
}

  Widget _task(String taskText, int index) {
    return Card(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      color: const Color.fromARGB(255, 213, 213, 218),
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(taskText),
                 leading: Radio(value: Colors.red,),
                 trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      tasks.removeAt(index);
                    });     
                  },
                  ),
              ),
            ),
          ],
        ),
    );
  }
  
}