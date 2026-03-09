import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Мое приложение',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(), // Главный экран
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ▼▼▼ ПЕРЕМЕННЫЕ СОСТОЯНИЯ ЗДЕСЬ ▼▼▼
  int _counter = 0;
  final _userName = "Вася";

  // ▼▼▼ ФУНКЦИИ ИЗМЕНЕНИЯ СОСТОЯНИЯ ЗДЕСЬ ▼▼▼
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔼 APP BAR (верхняя панель)
      appBar: AppBar(
        title: Text('Мое приложение'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),

      // 🎨 BODY (основное содержимое) - ТВОЯ КОНСТРУКЦИЯ!
      body: _buildBody(), // ← ВОТ ТАК ВЫНОСИМ В ОТДЕЛЬНЫЙ МЕТОД
    );
  }

  // ▼▼▼ ТВОЯ КОНСТРУКЦИЯ ИЗ ВИДЖЕТОВ - ВОТ ТАК! ▼▼▼
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(), // ← каждый блок в своем методе
          _buildContent(), // ← так чисто и понятно
          _buildFooter(), // ← легко менять порядок
        ],
      ),
    );
  }

  // 🔼 HEADER БЛОК
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Заголовок',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  // 📱 CONTENT БЛОК
  Widget _buildContent() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildUserInfo(),
            Divider(),
            _buildCounter(),
            Divider(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  // 👤 БЛОК ИНФОРМАЦИИ О ПОЛЬЗОВАТЕЛЕ
  Widget _buildUserInfo() {
    return Column(
      children: [
        Icon(Icons.person, size: 50),
        Text(
          _userName, // используем переменную состояния
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  // 🔢 БЛОК СЧЕТЧИКА
  Widget _buildCounter() {
    return Column(
      children: [
        Text('Счетчик:', style: TextStyle(fontSize: 18)),
        Text(
          '$_counter', // используем переменную состояния
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // 🔘 БЛОК КНОПОК
  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _incrementCounter, // используем функцию состояния
          child: Text('+1'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _counter = 0; // меняем состояние
            });
          },
          child: Text('Сбросить'),
        ),
      ],
    );
  }

  // 🔽 FOOTER БЛОК
  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Text('Подвал приложения', textAlign: TextAlign.center),
    );
  }
}
