import 'dart:io';

void main() {
  while (true) {
    print('\nВыберите операцию (+, -, *, /) или введите "q" для выхода.');
    String? input1 = stdin.readLineSync();
    if (input1 == "q") {
      print("До свидания!");
      break;
    }

    if (input1 != "+" && input1 != "-" && input1 != "*" && input1 != "/") {
      print("Неизвестная операция. Попробуйте снова!");
      continue;
    }

    num number1 = 0;
    num number2 = 0;
    bool isValid = true;

    try {
      print("Выберите первое число:");
      String? input2 = stdin.readLineSync();
      number1 = num.parse(input2!);
    } catch (e) {
      print("Ошибка! Введенное значение не является числом.");
      isValid = false;
      continue;
    }

    try {
      print("Выберите второе число:");
      String? input3 = stdin.readLineSync();
      number2 = num.parse(input3!);
    } catch (e) {
      print("Ошибка! Введенное значение не является числом.");
      isValid = false;
    }

    if (!isValid) {
      continue;
    }

    num result = 0;

    switch (input1) {
      case "+":
        result = number1 + number2;
        break;
      case "-":
        result = number1 - number2;
        break;
      case "*":
        result = number1 * number2;
        break;
      case "/":
        if (number2 == 0) {
          print("На ноль делить нельзя! Попробуйте выбрать другое число.");
          break;
        }
        result = number1 / number2;
        break;
    }

    print("Ваш ответ: $result");
  }
}
