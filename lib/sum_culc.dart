import 'dart:io';

void main() {
  print("Введите первое число:");
  String? input1 = stdin.readLineSync();

  print("Введите второе число:");
  String? input2 = stdin.readLineSync();

  try {
    num number1 = num.parse(input1!);
    num number2 = num.parse(input2!);
    num result = number1 + number2;
    print("Ваше число: $result");
  } catch (e) {
    print("Ошибка");
  }
}
