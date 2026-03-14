// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get nameHint => 'Enter your name';

  @override
  String hello(String userName) {
    return 'Hello $userName';
  }

  @override
  String get send => 'Send';

  @override
  String get title => 'Pizza Details';

  @override
  String get pizzaName => 'Pepperoni Pizza';

  @override
  String get pizzaIngridients => 'Ingridients: pepperoni, cheese, tomato sauce';

  @override
  String orderPizza(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You ordered $count pizzas',
      one: 'You ordered $count pizza',
      zero: 'You havent ordered any pizza yet',
    );
    return '$_temp0';
  }

  @override
  String orderPizzaButton(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Order $count pizzas',
      one: '$count pizza in order',
      zero: 'Order pizza',
    );
    return '$_temp0';
  }

  @override
  String pizzaSize(String size) {
    String _temp0 = intl.Intl.selectLogic(size, {
      'mini': 'Mini',
      'small': 'Small',
      'medium': 'Medium',
      'large': 'Large',
      'supersize': 'Supersize',
      'other': 'Unknown',
    });
    return '$_temp0';
  }

  @override
  String get pizzaSizeLabel => 'Select pizza size';

  @override
  String selectedSize(String size) {
    return 'Selected pizza size - $size';
  }
}
