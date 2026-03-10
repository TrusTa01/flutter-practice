// Деление на ноль

// void main() {
//   try {
//     print(divideNumbers(2, 2));
//     print("Успех!");
//   } catch (e) {
//     print("Произошла ошибка\n" +e.toString());
//   } finally {
//     print("Конец работы программы");
//   }
// }

// num divideNumbers (num a, num b) {
//   if (b == 0) {
//     throw Exception("Долбаеб на ноль делить нельзя");
//   }
//   return a / b;
// }


// второй вариант по хуже чем первый 

// void main() {
//  print(divideNumbers(2, 2));
// }

// num? divideNumbers (num a, num b) {
//  try {
//     if (b == 0) {
//       throw Exception("Ошибка");
//     } else {
//       return a / b;
//     }
//   } catch (e) {
//    print("Произошла ошибка\n" +e.toString());
//    return null;
//   } 
// }


// void main() {
//   print(stringToInt("123"));
//   print(stringToInt("abc"));
// }

// int? stringToInt(String str) {
//   try {
//     return int.parse(str);
//   } on FormatException catch (e) {
//     print("Произошла ошибка\n" + e.toString());
//     return null;
//   }
// }


// void main () {
//   var myList = [10, 20, 30];
//   getElementAtIndex(myList, 1);
//   getElementAtIndex(myList, "магазин");
// }

// getElementAtIndex (List list, dynamic index) {
//   try {
//     print('Элемент по индексу $index: ${list[index]}');
//   } on RangeError catch (e) {
//     print("Ошибка! Индекс вне диапазона\n" + e.toString());
//   } catch (e) {
//     print("Ошибка! Индекс передан в виде строки\n" + e.toString());
//   } finally {
//     print("Поиск элемента завершен");
//   }
// }