<div align="center">

# Flutter Practice

**Темы по Dart и Flutter, которые я прошёл, по одной на ветку: язык, UI, управление состоянием, навигация, сеть, локализация и тесты.**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Branches](https://img.shields.io/badge/topic%20branches-21-informational)](#карта-веток)

Учебный репозиторий · код лежит в ветках, а не в `main`

<a href="README.md"><img src="https://raw.githubusercontent.com/TrusTa01/TrusTa01/main/assets/lang/seg-en-off.svg" alt="English"></a><img src="https://raw.githubusercontent.com/TrusTa01/TrusTa01/main/assets/lang/seg-ru-on.svg" alt="Русский">

</div>

## Прогресс

✅ пройдено · 🔄 в процессе · ⬜ дальше

«Другие проекты» значит, что тему я изучил, когда делал другие приложения, поэтому её кода в этом репозитории нет.

### UI и вёрстка

| | Тема | Где |
|:---:|---|---|
| ✅ | Сложные `ListView` и `GridView` | [`flutter/basics`](https://github.com/TrusTa01/flutter-practice/tree/flutter/basics), [`flutter/small-projects`](https://github.com/TrusTa01/flutter-practice/tree/flutter/small-projects) |
| ✅ | Свои слайверы и физика прокрутки | другие проекты |
| ✅ | Адаптивная и отзывчивая вёрстка | другие проекты |

### Управление состоянием

| | Тема | Где |
|:---:|---|---|
| ✅ | `InheritedWidget`: как Flutter передаёт состояние вниз по дереву | [`native`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/native) |
| ✅ | `ChangeNotifier` | [`native`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/native) |
| ✅ | `ValueNotifier`: лёгкие обновления встроенными средствами | [`native`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/native) |
| ✅ | Provider: `MultiProvider`, `ProxyProvider` | [`provider`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/provider) |
| ✅ | Provider: выборочные перестроения | другие проекты |
| ✅ | Riverpod: провайдеры и генерация кода | [`riverpod`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/riverpod) |
| ✅ | Riverpod: `AsyncNotifier` | другие проекты |
| ✅ | BLoC и Cubit | другие проекты |

### Сеть

| | Тема | Где |
|:---:|---|---|
| ✅ | HTTP-запросы и обработка статусов | [`networking`](https://github.com/TrusTa01/flutter-practice/tree/topic/networking) |
| ✅ | JSON вручную и через `json_serializable` | [`networking`](https://github.com/TrusTa01/flutter-practice/tree/topic/networking) |
| 🔄 | Dio: интерсепторы и сетевой слой | другие проекты |

### Локальное хранение

| | Тема | Где |
|:---:|---|---|
| ✅ | Файлы через `path_provider` | [`local-storage`](https://github.com/TrusTa01/flutter-practice/tree/topic/local-storage) |
| ✅ | Shared Preferences | другие проекты |
| ✅ | Secure Storage | другие проекты |
| ✅ | Drift: реляционная база с ORM | другие проекты |
| ⬜ | sqflite | |
| ⬜ | Hive или Isar | |

### Навигация

| | Тема | Где |
|:---:|---|---|
| ✅ | Navigator 1.0: императивная навигация | [`imperative`](https://github.com/TrusTa01/flutter-practice/tree/topic/navigation/imperative) |
| ✅ | Navigator 2.0: декларативная навигация | [`declarative`](https://github.com/TrusTa01/flutter-practice/tree/topic/navigation/declarative) |
| ✅ | GoRouter | [`declarative`](https://github.com/TrusTa01/flutter-practice/tree/topic/navigation/declarative) |
| ✅ | GoRouter: диплинки и вложенная навигация | другие проекты |
| ✅ | AutoRoute: генерация маршрутов и гарды | другие проекты |

### Локализация и тесты

| | Тема | Где |
|:---:|---|---|
| ✅ | Тексты, множественное число, даты, числа и валюта на двух языках | [`localization-root`](https://github.com/TrusTa01/flutter-practice/tree/topic/localization-root) и три ветки после неё |
| ✅ | Unit-тесты | [`tests/unit`](https://github.com/TrusTa01/flutter-practice/tree/topic/tests/unit) |

### Архитектура

| | Тема | Где |
|:---:|---|---|
| ✅ | SOLID | другие проекты |
| ✅ | Clean Architecture: слои domain, data и presentation | другие проекты |
| ✅ | Server-Driven UI: экраны из JSON-конфигов | другие проекты |
| ✅ | Структура папок по фичам и по слоям | другие проекты |

Cubit, AutoRoute, Dio, Secure Storage, Shared Preferences и слои по фичам можно посмотреть в [flutter-shelf-auth-module](https://github.com/TrusTa01/flutter-shelf-auth-module).

## Что внутри веток

**Dart.** В [`dart/basics`](https://github.com/TrusTa01/flutter-practice/tree/dart/basics) по файлу на каждую возможность языка: null safety, классы и ООП, миксины, enum, `copyWith`, обработка ошибок, а дальше асинхронный код, дженерики, расширения и изоляты. В [`dart/codewars-tasks`](https://github.com/TrusTa01/flutter-practice/tree/dart/codewars-tasks) 16 решённых ката с Codewars (десять 8 kyu, шесть 7 kyu). [`dart/small-projects`](https://github.com/TrusTa01/flutter-practice/tree/dart/small-projects) — консольные игры и утилиты: калькулятор, конвертер валют, викторина, «угадай число» и «камень, ножницы, бумага».

**Flutter UI.** [`flutter/basics`](https://github.com/TrusTa01/flutter-practice/tree/flutter/basics) начинается с вёрстки и переходит к небольшим приложениям: счётчик, калькулятор, список дел и два экрана погоды. [`flutter/features`](https://github.com/TrusTa01/flutter-practice/tree/flutter/features) нужна, чтобы пробовать виджеты по одному; пока там `CarouselView` в обычной и `weighted`-раскладке.

**Мини-приложения.** В [`flutter/small-projects`](https://github.com/TrusTa01/flutter-practice/tree/flutter/small-projects) их два. Форма регистрации проверяет каждое поле и показывает введённые данные на следующем экране. Записная книжка позволяет добавлять, открывать, редактировать и удалять контакты (удаление с подтверждением), хранит список в Provider, переключает экраны через именованные маршруты и подгружает пользователей с JSONPlaceholder.

**Управление состоянием.** Одни и те же идеи в четырёх ветках, от встроенных средств Flutter до библиотек. [`native`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/native): `InheritedWidget`, `ChangeNotifier` и `ValueNotifier` без пакетов. [`provider`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/provider): приложение из трёх экранов на `MultiProvider`, `ChangeNotifierProvider`, `ProxyProvider` и `context.watch`. [`riverpod`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/riverpod): небольшой магазин с корзиной, список товаров на генерации кода `@riverpod`, корзина на `Notifier`. В [`state-management-root`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management-root) собраны первые версии всех примеров. BLoC и Cubit я изучил на других проектах; в их ветке [`bloc`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/bloc) только план темы.

**Навигация.** [`imperative`](https://github.com/TrusTa01/flutter-practice/tree/topic/navigation/imperative): `Navigator.push` и `pop`, таблица маршрутов и `onGenerateRoute`, передача данных на следующий экран и нижняя панель, где у каждой вкладки свой стек `Navigator`. [`declarative`](https://github.com/TrusTa01/flutter-practice/tree/topic/navigation/declarative): навигация на `go_router`, маршрут с параметром в пути, `redirect` в зависимости от входа в аккаунт и своя страница ошибки.

**Сеть.** [`topic/networking`](https://github.com/TrusTa01/flutter-practice/tree/topic/networking) получает данные через `http` из трёх открытых источников: JSONPlaceholder, Open Brewery DB и список офисов Google. У одних моделей `fromJson` написан вручную, другие сгенерированы `json_serializable`; список офисов разобран обоими способами для сравнения.

**Локальное хранение.** [`topic/local-storage`](https://github.com/TrusTa01/flutter-practice/tree/topic/local-storage) сохраняет текстовый файл в папку документов приложения, найденную через `path_provider`, и читает его обратно.

**Локализация.** Приложение на английском и русском на `flutter_localizations`, `intl` и ARB-файлах, с кнопкой, которая меняет язык без перезапуска. [`localization-root`](https://github.com/TrusTa01/flutter-practice/tree/topic/localization-root) всё это настраивает, а каждая следующая ветка добавляет один вид значений. [`text`](https://github.com/TrusTa01/flutter-practice/tree/topic/localization/text): подстановки, множественное число и `select`. [`date`](https://github.com/TrusTa01/flutter-practice/tree/topic/localization/date): типизированные подстановки `DateTime` в форматах `yMd`, `yMMMMd` и `Hm`. [`currency`](https://github.com/TrusTa01/flutter-practice/tree/topic/localization/currency): целые и дробные числа, проценты и деньги в том виде, как их пишут в текущей локали.

**Тесты.** В [`topic/tests/unit`](https://github.com/TrusTa01/flutter-practice/tree/topic/tests/unit) класс калькулятора и 6 unit-тестов на `flutter_test` для него; один проверяет деление на ноль.

**Заметки.** [`docs`](https://github.com/TrusTa01/flutter-practice/tree/docs) — текстовые заметки, которые я вёл во время учёбы: шпаргалка, асинхронность и руководство по вёрстке.

## Как запустить ветку

Нужно: Flutter SDK, эмулятор или телефон.

```bash
git clone https://github.com/TrusTa01/flutter-practice.git
cd flutter-practice
git checkout topic/navigation/declarative
flutter pub get
flutter run
```

Просто `flutter run` работает там, где в ветке есть `lib/main.dart`: `provider`, `riverpod`, `declarative`, четыре ветки локализации и `tests/unit`. В остальных Flutter-ветках у каждого примера свой `main()`, поэтому файл нужно указать:

```bash
flutter run -t lib/first_projects/todo_list.dart   # flutter/basics
```

На GitHub ничего клонировать не нужно: открой ветку из меню веток или по ссылкам выше.

## Карта веток

```
main                              # этот README
├── dart/
│   ├── basics                    # возможности языка, по файлу на каждую
│   ├── codewars-tasks            # 16 ката
│   └── small-projects            # консольные программы
├── flutter/
│   ├── basics                    # вёрстка и первые приложения
│   ├── features                  # отдельные виджеты: CarouselView
│   └── small-projects            # форма регистрации, записная книжка
├── topic/
│   ├── state-management-root     # первые версии примеров
│   ├── state-management/
│   │   ├── native                # InheritedWidget, ChangeNotifier, ValueNotifier
│   │   ├── provider
│   │   ├── riverpod              # магазин с корзиной, кодогенерация
│   │   └── bloc                  # только план, изучено на других проектах
│   ├── navigation/
│   │   ├── imperative            # Navigator, именованные и вложенные маршруты
│   │   └── declarative           # go_router
│   ├── networking                # http, json_serializable
│   ├── local-storage             # path_provider
│   ├── localization-root         # настройка, EN и RU
│   ├── localization/
│   │   ├── text
│   │   ├── date
│   │   └── currency
│   └── tests/unit                # 6 unit-тестов
└── docs                          # учебные заметки
```
