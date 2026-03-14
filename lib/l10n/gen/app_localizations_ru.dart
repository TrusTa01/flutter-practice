// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get nameHint => 'Введите ваше имя';

  @override
  String hello(String userName) {
    return 'Привет, $userName!';
  }

  @override
  String get send => 'Отправить';

  @override
  String get title => 'Детали пиццы';

  @override
  String get pizzaName => 'Пицца пеперони';

  @override
  String get pizzaIngridients => 'Ингридиенты: пеперони, сыр, томатный соус';

  @override
  String orderPizza(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Вы заказали $count пицц',
      few: 'Вы заказали $count пиццы',
      one: 'Вы заказали $count пиццу',
      zero: 'Вы еще не заказывали ни одной пиццы',
    );
    return '$_temp0';
  }

  @override
  String orderPizzaButton(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'В заказе $count пицц',
      few: 'В заказе $count пиццы',
      one: 'В заказе $count пицца',
      zero: 'Заказать пиццу',
    );
    return '$_temp0';
  }

  @override
  String pizzaSize(String size) {
    String _temp0 = intl.Intl.selectLogic(size, {
      'mini': 'Мини',
      'small': 'Маленький',
      'medium': 'Средний',
      'large': 'Большой',
      'superSize': 'Суперсайз',
      'other': 'Неизвестный',
    });
    return '$_temp0';
  }

  @override
  String get pizzaSizeLabel => 'Выберете размер пиццы';

  @override
  String selectedSize(String size) {
    return 'Выбранный размер пиццы - $size';
  }
}
