// ignore_for_file: avoid_print

class Calculator {
  String lastValue = 'Не определено';

  late Stopwatch timer;

  Future<void> init() async {
    timer = Stopwatch()..start();

    // Имитация длительной инициализации
    await Future.delayed(Duration(seconds: 3));

    print('Инициализация завершена');
  }

  String add(int a, int b) => lastValue = (a + b).toString();

  String substract(int a, int b) => lastValue = (a - b).toString();
  String multiply(int a, int b) => lastValue = (a * b).toString();

  String divide(int a, int b) {
    if (b == 0) {
      lastValue = 'Ошибка';
      throw ArgumentError('На ноль делить нельзя');
    }
    return lastValue = (a / b).toString();
  }
}
