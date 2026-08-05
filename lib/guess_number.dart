import 'dart:io';
import 'dart:math';

void main() {
  var randomNumber = Random().nextInt(100) + 1;
  int attempts = 0;
  print("\nПривет! Это игра угадай число.");
  while (true) {
    num guess = 0;
    print("Введи число от 1 до 100 или введите 'q' для выхода.\n");
    String? input = stdin.readLineSync();

    if (input == "q") {
      print("Пока!");
      break;
    }

    try {
      guess = num.parse(input!);
    } catch (e) {
      print("\nОшибка! Введенное значение не является числом.");
      continue;
    }

    if (guess < 1 || guess > 100) {
      print("\nОшибка! Введенное значение меньше одного или больше ста.");
      continue;
    }

    if (guess < randomNumber) {
      attempts++;
      print("\nБольше! Попробуй еще.");
    } else if (guess > randomNumber) {
      attempts++;
      print("\nМеньше! Попробуй еще.");
    } else {
      print(
        "Поздравляю! Ты угадал(а) число $randomNumber за $attempts попытки(-ок)!",
      );
      break;
    }
  }
}
