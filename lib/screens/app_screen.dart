import 'package:flutter/material.dart';
import 'package:flutter_application_default/extensions/context_ext.dart';
import 'package:flutter_application_default/l10n/gen/app_localizations.dart';

class DemoAppScreen extends StatefulWidget {
  final VoidCallback onLocaleToggle;

  DemoAppScreen({super.key, required this.onLocaleToggle});

  @override
  _DemoAppScreenState createState() => _DemoAppScreenState();
}

class _DemoAppScreenState extends State<DemoAppScreen> {
  final _nameController = TextEditingController();
  String? _greeting;
  int _counter = 0;
  String _selectedPizzaSize = 'medium'; // Значение по умолчанию

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _updateGreeting(AppLocalizations localizations) {
    if (_nameController.text.trim().isNotEmpty) {
      setState(() {
        _greeting = localizations.hello(_nameController.text.trim());
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_greeting != null && _nameController.text.trim().isNotEmpty) {
      _updateGreeting(context.l10n);
    }
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
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: context.l10n.nameHint,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _updateGreeting(context.l10n),
                    child: Text(context.l10n.send),
                  ),
                ],
              ),

              if (_greeting != null) ...[
                const SizedBox(height: 16),
                Text(
                  _greeting!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
              ],
              Text(
                context.l10n.pizzaName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 26),
              Text(
                context.l10n.pizzaIngridients,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 26),
              Text(
                context.l10n.orderPizza(_counter),
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              // Кнопка заказа пиццы
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text(context.l10n.orderPizzaButton(_counter)),
              ),
              const SizedBox(height: 24),
              Text(
                context.l10n.pizzaSizeLabel,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: _selectedPizzaSize,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedPizzaSize = newValue;
                    });
                  }
                },
                items: <String>['mini', 'small', 'medium', 'large', 'supersize']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(context.l10n.pizzaSize(value)),
                      );
                    })
                    .toList(),
              ),
              const SizedBox(height: 16),
              Text(
                context.l10n.pizzaSize(_selectedPizzaSize),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
