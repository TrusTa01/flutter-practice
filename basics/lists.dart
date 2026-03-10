// void main() {
//   // Примеры использования здесь
//   List<int> numbers = [1, 2, 3, 4, 5];

//   // Используем методы из шпоры
//   var doubled = numbers.map((n) => n * 2).toList();
//   print(doubled); // [2, 4, 6, 8, 10]
// }

// void main() {
//   List<int> numbersList = [1, 5, 6, 3, 9, 3];
//   numbersList.removeAt(1);
//   numbersList.contains(5);
//   print(numbersList);

//   Set<int> numbersSet = numbersList.toSet();
//   print(numbersSet);

//   Map<int, int> numbersMap = numbersList.asMap();
//   print(numbersMap);
//   print(numbersMap[1]);
// }

void main() {
  List<int> list1 = [10, 15, 20, 0, 30];

  var list2 = list1.map((number) => number + 5).toList();

  bool hasIvenNumbers = list2.any((number) => number % 2 == 0);

  var list3 = list1.where((number) => number > 0);

  var list4 = list1.fold(0, (previosValue, number) => previosValue + number);

  print(list1);
  print(list2);
  print(hasIvenNumbers);
  print(list3);
  print(list4);
}
