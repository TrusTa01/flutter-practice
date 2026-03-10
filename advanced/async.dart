// // import 'dart:math';

// // void main() async {
// //   final sec1 = await makeCoffee(1);
// //   final sec2 = await makeCoffee(2);
// //   final sec3 = await makeCoffee(3);

// //   print('Кофейня закончила работать!');
// //   print('Все кофе приготовили за ${sec1 + sec2 + sec3} секунд');
// // }

// // Future<int> makeCoffee(int number) async {
// //   print('Делаем кофе номер $number');
// //   final random = Random();
// //   final seconds = random.nextInt(6);
// //   Future.delayed(Duration(seconds: seconds));
// //   print('Сделали кофе номер $number за $seconds секунд\n');
// //   return seconds;
// // }

// // void main() async {
// //   print('Начинаю работу...');
// //   String result = await fetchData();
// //   print(result); // Выведется через 2 секунды
// //   print('Работа завершена.');
// // }

// // Future<String> fetchData () async {
// //   await Future.delayed(Duration(seconds: 2), () => 'Данные получены');
// //   return 'Данные получены';
// // }

// // void main() async {
// //   print('Запускаю оба запроса.');
// //   var userFuture = fetchUser();
// //   var productsFuture = fetchProducts();

// //   var results = await Future.wait([userFuture, productsFuture]);
// //   print('Пользователь: ${results[0]}');
// //   print('Продукты: ${results[1]}');
// // }





// // Future<String> fetchUserOrder() async {
// //   await Future.delayed(Duration(seconds: 2));
// //   return 'Большой маккомбо и кола';
// // }

// // void main() async {
// //   print('Программа начала работу...');
// //   print('Заказываем еду...');

// //   final order = await fetchUserOrder();
// //   print('Ваш заказ: $order');

// //   print('Программа завершила работу.');
// // }



// // void main() async {
// //   print('22222');
// //   final order = await makeCoffee();
// //   print(order);
// // }


// // Future<String> makeCoffee() async {
// //   await Future.delayed(Duration(seconds: 2));
// //   return 'Заказ';
// // }



// Future<String> userLogin() async{
//   await Future.delayed(Duration(seconds: 4));
//   return 'user1234';
// }

// Future<String> getUserData(String userId) async{
//   await Future.delayed(Duration(seconds: 2));
//   return 'Данные пользователя $userId';
// }

// void main() async {
//   print('Начало работы');
//   final user = await userLogin();
//   final userData = await getUserData('dddd');

//   print(user);
//   print(userData);
// }