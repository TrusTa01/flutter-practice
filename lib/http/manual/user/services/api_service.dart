import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<User>> getUsers() async {
    print('🚀 Начинаем загрузку пользователей...');

    // 1. СОЗДАЕМ URL для запроса
    final url = Uri.parse('$_baseUrl/users');
    print('📡 URL запроса: $url');

    // 2. ОТПРАВЛЯЕМ GET ЗАПРОС к серверу
    print('🔄 Отправляем запрос к серверу...');

    // 3. ПРОВЕРЯЕМ СТАТУС ОТВЕТА
    final response = await http.get(url);
    print('📊 Сервер ответил с статусом: ${response.statusCode}');
    if (response.statusCode == 200) {
      print('✅ Данные успешно получены!');

      // 4. ПРЕОБРАЗУЕМ JSON СТРОКУ В DART ОБЪЕКТЫ
      print('🔨 Начинаем преобразование JSON...');
      final List<dynamic> jsonList = json.decode(response.body);
      print('📋 Получено ${jsonList.length} пользователей в JSON');

      // 5. ПРЕОБРАЗУЕМ КАЖДЫЙ JSON ОБЪЕКТ В USER
      List<User> users = [];

      for (var jsonUser in jsonList) {
        User user = User.fromJson(jsonUser);
        users.add(user);
        print('👤 Создан пользователь: ${user.name}');
      }
      print(
        '🎉 Преобразование завершено! Всего пользователей: ${users.length}',
      );
      return users; // Возвращаем готовый список пользователей
    } else {
      // ОШИБКА! Сервер вернул ошибку
      print('❌ Ошибка при загрузке: ${response.statusCode}');
      print('📄 Текст ошибки: ${response.body}');
      throw Exception(
        'Не удалось загрузить пользователей: ${response.statusCode}',
      );
      // ОБЪЯСНЕНИЕ: throw Exception - "бросаем" ошибку, чтобы ее можно было поймать и показать пользователю
    }
  }
}
