// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get title => 'Детали пиццы';

  @override
  String dateFormat1(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Дата: $dateString';
  }

  @override
  String dateFormat2(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Дата: $dateString';
  }

  @override
  String timeFormat(DateTime time) {
    final intl.DateFormat timeDateFormat = intl.DateFormat.Hm(localeName);
    final String timeString = timeDateFormat.format(time);

    return 'Время: $timeString';
  }

  @override
  String dateTimeFormat(DateTime dateTime) {
    final intl.DateFormat dateTimeDateFormat = intl.DateFormat(
      'y/M/d H:mm',
      localeName,
    );
    final String dateTimeString = dateTimeDateFormat.format(dateTime);

    return 'Дата и время: $dateTimeString';
  }

  @override
  String get updateDateTimeButton => 'Обновить дату и время';

  @override
  String get dateNotSelected => 'Дата не выбрана';
}
