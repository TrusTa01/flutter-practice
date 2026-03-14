import 'package:flutter/material.dart';
import 'package:flutter_application_default/extensions/context_ext.dart';

class DemoAppScreen extends StatefulWidget {
  final VoidCallback onLocaleToggle;

  DemoAppScreen({super.key, required this.onLocaleToggle});

  @override
  _DemoAppScreenState createState() => _DemoAppScreenState();
}

class _DemoAppScreenState extends State<DemoAppScreen> {
  DateTime? _currentDateTime;

  void _updateDateTime() {
    setState(() {
      _currentDateTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.title),
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
              // Обычный формат даты
              Text(
                _currentDateTime == null
                    ? context.l10n.dateNotSelected
                    : context.l10n.dateFormat1(_currentDateTime!),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Полный формат даты
              Text(
                _currentDateTime == null
                    ? context.l10n.dateNotSelected
                    : context.l10n.dateFormat2(_currentDateTime!),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Время
              Text(
                _currentDateTime == null
                    ? context.l10n.dateNotSelected
                    : context.l10n.timeFormat(_currentDateTime!),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Объедененный формат даты и времени
              Text(
                _currentDateTime == null
                    ? context.l10n.dateNotSelected
                    : context.l10n.dateTimeFormat(_currentDateTime!),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),

              // Кнопка для обновления даты и времени
              ElevatedButton(
                onPressed: _updateDateTime,
                child: Text(context.l10n.updateDateTimeButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
