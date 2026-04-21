// ignore_for_file: avoid_print

import 'package:flutter_application_default/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Тест класса Calculator', () {
    // Arrange - подготовка данных
    final Calculator calculator = Calculator();

    setUpAll(() async {
      await calculator.init();
    });

    test('Тест сложения', () {
      // Act - вызов функции или действия
      final result = calculator.add(2, 5);

      // Assert - Проверка результата
      expect(result, equals('7'));

      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });

    test('Тест сложения 2', () {
      print('Last value : ${calculator.lastValue}');
      final result = calculator.add(2, 3);
      expect(result, equals('5'));
      expect(calculator.lastValue, equals('5'));
      print('Last value : ${calculator.lastValue}');
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });

    test('Тест вычитания', () {
      final result = calculator.substract(5, 3);
      expect(result, equals('2'));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });

    test('Тест умножения', () {
      final result = calculator.multiply(3, 4);
      expect(result, equals('12'));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });

    test('Тест деления', () {
      final result = calculator.divide(6, 3);
      expect(result, equals('2.0'));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });

    test('Тест деления на 0', () {
      expect(() => calculator.divide(6, 0), throwsA(isA<ArgumentError>()));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });
  });
}
