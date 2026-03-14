import 'package:flutter/material.dart';
import 'package:flutter_application_default/extensions/context_ext.dart';

class DemoAppScreen extends StatefulWidget {
  final VoidCallback onLocaleToggle;

  DemoAppScreen({super.key, required this.onLocaleToggle});

  @override
  _DemoAppScreenState createState() => _DemoAppScreenState();
}

class _DemoAppScreenState extends State<DemoAppScreen> {
  // Стартовые значения
  int _integerValue = 1234567;
  double _decimalValue = 1234.56;
  double _percentValue = 0.75;
  double _currencyValue = 1234.56;

  // Метод для обновления значений
  void _updateValues() {
    setState(() {
      _integerValue = (_integerValue * 1.5).round();
      _decimalValue = _decimalValue * 1.25;
      _percentValue = (_percentValue + 0.1) % 1.0;
      _currencyValue = _currencyValue * 1.3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localization practice'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: widget.onLocaleToggle,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Целое число
              Text(
                context.l10n.formatInteger(_integerValue),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Дробное число
              Text(
                context.l10n.formatDecimal(_decimalValue),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Проценты
              Text(
                context.l10n.formatPercent(_percentValue),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Валюта
              Text(
                context.l10n.formatCurrency(_currencyValue),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Кнопка для обновления даты и времени
              ElevatedButton(
                onPressed: _updateValues,
                child: Text(context.l10n.updateValues),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
