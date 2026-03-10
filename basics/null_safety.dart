// Ошибка
// void main() {
//   String? boxOfEggs;
//   if (boxOfEggs != null) {
//     print(boxOfEggs.substring(0, 1));
//   }
//   print('Строка пуста');
// }

// Рабочий, но ужасный способ
// void main() {
//   String? boxOfEggs = getBoxOfEggs();
//   if (boxOfEggs != null) {
//     print(boxOfEggs.substring(0, 1));
//   } else {
//     print('Строка пуста');
//   }
// }

// String? getBoxOfEggs() {
//   String? boxOfEggs = 'Cтрока';
//   return boxOfEggs;
// }

// Как нужно
// void main () {
//  String? name = _getUserName();
//  print(name?.substring(0, 1));
//  print(name!.substring(0, 1)); // Опасный вариант, уверяем компилятор что в name точно что-то есть. Лучше использовтаь '?'.
// }

// String? _getUserName() {
//   return 'ававава';
// }

// COALESCING NULL оператор
// void main() {
//   String? name = null;
//   name = _setName();
//   String displayName = name?.substring(0, 2) ?? 'Имя не указано';
//   print(displayName);
// }

// String? _setName() {
//   return 'Саша';
// }

// На примере классов

void main() {
  final sasha = User(name: 'Саша', email: 'shasa@gmail.com', phone: '222222');
  // String displayName = sasha.name ?? sasha.email ?? sasha.phone ?? 'Данные не указаны'; Вариант 1
  print(sasha.displayName);
}

class User {
  final String? name;
  final String? email;
  final String? phone;

  const User({this.name, this.email, this.phone});

  String get displayName =>
      name ??
      email ??
      phone ??
      'Данные не указаны'; // Вариант 2 (Более красивый)
}

// Важно! Оператор ?? как и оператор ? выводит только первое истинное значение
// Вариант для объединения всех данных
// String get displayName => [name, email, phone]
//     .where((value) => value != null)
//     .join(', ');
