import 'dart:io';

void main() {
  final List<Map<String, Object>> questions = [
    {
      'question': 'Столица Венгрии',
      'answers': ['Венеция', 'Мумбаи', 'Будапешт'],
      'correctIndex': 2,
    },

    {
      'question': 'Столица Сша',
      'answers': ['Вашингтон', 'Нью-Йорк', 'Лос-Анжелес'],
      'correctIndex': 0,
    },

    {
      'question': 'Столица Канады',
      'answers': ['Торонто', 'Оттава', 'Ванкувер'],
      'correctIndex': 1,
    },
  ];

  int score = 0;

  print('Добро пожаловать в викторину!');
  print('Ответьте на ${questions.length} вопросов.');
  print('Для выхода введите "q"');
  print('----------------------------------------');

  for (int i = 0; i < questions.length; i++) {
    Map<String, Object> currentQuestion = questions[i];
    String questionText = currentQuestion['question'] as String;
    List<String> answers = currentQuestion['answers'] as List<String>;
    int correctIndex = currentQuestion['correctIndex'] as int;

    print('\nВопрос ${i + 1}: $questionText');
    for (int j = 0; j < answers.length; j++) {
      print('${j + 1}. ${answers[j]}');
    }

    print('Ваш ответ (введите номер):');
    String? userInput = stdin.readLineSync();

    if (userInput == 'q') {
      print('Выход из викторины.');
      break;
    }

    try {
      int userChoice = int.parse(userInput!) - 1;

      if (userChoice == correctIndex) {
        print('Верно!');
        score++;
      } else {
        print(
          'Неверно! Правильный ответ: ${correctIndex + 1}. ${answers[correctIndex]}',
        );
      }
    } catch (e) {
      print('Ошибка! Введите номер ответа.');
    }
  }

  print('\n${'=' * 30}');
  print('Викторина завершена!');
  print('Ваш результат: $score из ${questions.length}');

  if (score == questions.length) {
    print('Идеально! Вы настоящий эксперт!');
  } else if (score >= questions.length / 2) {
    print('Хороший результат!');
  } else {
    print('Попробуйте еще раз!');
  }
}
