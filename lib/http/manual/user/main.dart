import 'package:flutter/material.dart';
import 'models/user.dart';          
import 'services/api_service.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users App', 
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UsersListScreen(),
    );
  }
}

class UsersListScreen extends StatefulWidget {
  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  late Future<List<User>> futureUsers;
  // ОБЪЯСНЕНИЕ:
  // late - "я обещаю инициализировать эту переменную позже"
  // Future<List<User>> - "обещание что здесь будет список пользователей"
  // futureUsers - сама переменная где будем хранить данные

  // МЕТОД initState - вызывается ПРИ СОЗДАНИИ виджета
  @override
  void initState() {
    super.initState(); // Всегда вызываем родительский метод
    print('🎬 Экран создан, начинаем загрузку данных...');
    
    // ИНИЦИАЛИЗИРУЕМ нашу переменную данными
    futureUsers = ApiService.getUsers();
    // ОБЪЯСНЕНИЕ:
    // ApiService.getUsers() - вызывает наш метод который получает пользователей
    // futureUsers теперь содержит "обещание" на список пользователей
  }

  // МЕТОД build - описывает как выглядит экран
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold - стандартная "страница" Flutter с AppBar и т.д.
      appBar: AppBar(
        title: Text('Список пользователей'), // Заголовок
      ),
      body: FutureBuilder<List<User>>(
        // FutureBuilder - умный виджет который сам решает что показывать:
        // - пока данные грузятся → показываем крутилку
        // - данные пришли → показываем список
        // - ошибка → показываем сообщение об ошибке
        
        future: futureUsers, // Какие данные мы ждем
        builder: (context, snapshot) {
          // builder - функция которая возвращает виджет в зависимости от состояния
          // snapshot - "снимок" текущего состояния загрузки
          
          print('🔄 FutureBuilder обновляется. Состояние: ${snapshot.connectionState}');
          
          // ПРОВЕРЯЕМ: данные еще грузятся?
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('⏳ Показываем индикатор загрузки...');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(), // Крутящееся колечко
                  SizedBox(height: 20), // Отступ
                  Text('Загружаем пользователей...'),
                ],
              ),
            );
          }
          
          // ПРОВЕРЯЕМ: произошла ли ошибка?
          else if (snapshot.hasError) {
            print('❌ Произошла ошибка: ${snapshot.error}');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 64, color: Colors.red),
                  SizedBox(height: 20),
                  Text(
                    'Ошибка: ${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // При нажатии пробуем загрузить снова
                      print('🔄 Пользователь нажал "Попробовать снова"');
                      setState(() {
                        futureUsers = ApiService.getUsers();
                      });
                    },
                    child: Text('Попробовать снова'),
                  ),
                ],
              ),
            );
          }
          
          // ПРОВЕРЯЕМ: данные успешно загрузились?
          else if (snapshot.hasData) {
            final users = snapshot.data!; // Берем данные (восклицательный знак = "я уверен что данные есть!")
            print('✅ Данные загружены! Показываем ${users.length} пользователей');
            
            return ListView.builder(
              // ListView.builder - создает прокручиваемый список
              itemCount: users.length, // Сколько элементов в списке
              itemBuilder: (context, index) {
                // itemBuilder - функция которая создает КАЖДЫЙ элемент списка
                final user = users[index]; // Берем пользователя по номеру
                return UserCard(user: user); // Создаем карточку для него
              },
            );
          }
          
          // ЕСЛИ НИ ОДНО УСЛОВИЕ НЕ ВЫПОЛНИЛОСЬ
          return Center(
            child: Text('Неизвестное состояние'),
          );
        },
      ),
    );
  }
}

// КЛАСС UserCard - карточка для отображения одного пользователя
class UserCard extends StatelessWidget {
  final User user; // Пользователь которого будем показывать

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card - виджет который выглядит как карточка с тенью
      margin: EdgeInsets.all(8.0), // Отступы со всех сторон
      child: ListTile(
        // ListTile - стандартный элемент списка в Material Design
        leading: CircleAvatar(
          // leading - что показываем слева
          child: Text(
            user.name[0], // Первая буква имени
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          user.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          // subtitle - что показываем под заголовком
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('@${user.username}'), // Логин
            Text(user.email),           // Email
            Text(user.phone),           // Телефон
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios), // Иконка справа
        onTap: () {
          // Что происходит при нажатии на карточку
          print('👆 Нажат пользователь: ${user.name}');
          // Можно добавить переход на детальную страницу
        },
      ),
    );
  }
}