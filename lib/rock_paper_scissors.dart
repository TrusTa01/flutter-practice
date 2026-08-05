import 'dart:io';
import 'dart:math';

Map<String, String> rules = {
  'Камень': 'Ножницы',
  'Ножницы': 'Бумага',
  'Бумага': 'Камень',
};

List<String> choices = ['Камень', 'Ножницы', 'Бумага'];

int score = 0;

void main() {
  print(
    '------------------------------------------------------------------------------------',
  );
  print(
    'Привет, это игра камень ножницы бумага. Испытайте вашу удачу или нажмите "q" для выхода.',
  );
  while (true) {
    final random = Random();
    final int randomIndex = random.nextInt(choices.length);
    final computerChoice = choices[randomIndex];
    print(
      'Введите "1" для Камня, "2" для Ножниц, "3" для Бумаги или "q" для выхода.',
    );

    try {
      String? userInput = stdin.readLineSync();

      if (userInput?.toLowerCase() == 'q') {
        print('До свидания! Твой счет: $score');
        break;
      }

      if (userInput == null || userInput.isEmpty) {
        print("Не правильный ввод! Введите число от 1 до 3.");
        continue;
      }

      int userChoice = int.parse(userInput);

      if (userChoice < 1 || userChoice > 3) {
        print("Не правильный ввод! Введите число от 1 до 3.");
        continue;
      }

      String userChoiceText = choices[userChoice - 1];

      print('Твой выбор: $userChoiceText');
      print('Выбор компьютера: $computerChoice');

      if (rules[userChoiceText]!.contains(computerChoice)) {
        print('Победа!');
        score++;
      } else if (rules[computerChoice]!.contains(userChoiceText)) {
        print('Поражение :(');
        score--;
      } else {
        print('Ничья');
      }

      print('Текущий счет: $score\n');
    } catch (e) {
      print('Пожалуйста введите только "1", "2", "3" или "q" для выхода.');
    }
  }
}
