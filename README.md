<div align="center">

# Flutter Practice

**Dart and Flutter topics I worked through, one per branch: the language, UI, state management, navigation, networking, localization and tests.**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Branches](https://img.shields.io/badge/topic%20branches-21-informational)](#branch-map)

Learning repository · the code lives in the branches, not in `main`

<img src="https://raw.githubusercontent.com/TrusTa01/TrusTa01/main/assets/lang/seg-en-on.svg" alt="English"><a href="README.ru.md"><img src="https://raw.githubusercontent.com/TrusTa01/TrusTa01/main/assets/lang/seg-ru-off.svg" alt="Русский"></a>

</div>

## Progress

✅ done · 🔄 in progress · ⬜ next

"Other projects" means I learned the topic while building other apps, so its code is not in this repository.

### UI and layout

| | Topic | Where |
|:---:|---|---|
| ✅ | Complex `ListView` and `GridView` | [`flutter/basics`](https://github.com/TrusTa01/flutter-practice/tree/flutter/basics), [`flutter/small-projects`](https://github.com/TrusTa01/flutter-practice/tree/flutter/small-projects) |
| ✅ | Custom slivers and scroll physics | other projects |
| ✅ | Responsive and adaptive layouts | other projects |

### State management

| | Topic | Where |
|:---:|---|---|
| ✅ | `InheritedWidget`: how Flutter passes state down the tree | [`native`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/native) |
| ✅ | `ChangeNotifier` | [`native`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/native) |
| ✅ | `ValueNotifier`: light updates with built-in tools | [`native`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/native) |
| ✅ | Provider: `MultiProvider`, `ProxyProvider` | [`provider`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/provider) |
| ✅ | Provider: selective rebuilds | other projects |
| ✅ | Riverpod: providers and code generation | [`riverpod`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/riverpod) |
| ✅ | Riverpod: `AsyncNotifier` | other projects |
| ✅ | BLoC and Cubit | other projects |

### Networking

| | Topic | Where |
|:---:|---|---|
| ✅ | HTTP requests and status handling | [`networking`](https://github.com/TrusTa01/flutter-practice/tree/topic/networking) |
| ✅ | JSON by hand and with `json_serializable` | [`networking`](https://github.com/TrusTa01/flutter-practice/tree/topic/networking) |
| 🔄 | Dio: interceptors and a network layer | other projects |

### Local storage

| | Topic | Where |
|:---:|---|---|
| ✅ | Files with `path_provider` | [`local-storage`](https://github.com/TrusTa01/flutter-practice/tree/topic/local-storage) |
| ✅ | Shared Preferences | other projects |
| ✅ | Secure Storage | other projects |
| ✅ | Drift: a relational database with an ORM | other projects |
| ⬜ | sqflite | |
| ⬜ | Hive or Isar | |

### Navigation

| | Topic | Where |
|:---:|---|---|
| ✅ | Navigator 1.0: imperative routing | [`imperative`](https://github.com/TrusTa01/flutter-practice/tree/topic/navigation/imperative) |
| ✅ | Navigator 2.0: declarative routing | [`declarative`](https://github.com/TrusTa01/flutter-practice/tree/topic/navigation/declarative) |
| ✅ | GoRouter | [`declarative`](https://github.com/TrusTa01/flutter-practice/tree/topic/navigation/declarative) |
| ✅ | GoRouter: deep links and nested navigation | other projects |
| ✅ | AutoRoute: generated routes and guards | other projects |

### Localization and tests

| | Topic | Where |
|:---:|---|---|
| ✅ | Text, plurals, dates, numbers and currency in two languages | [`localization-root`](https://github.com/TrusTa01/flutter-practice/tree/topic/localization-root) and the three branches after it |
| ✅ | Unit tests | [`tests/unit`](https://github.com/TrusTa01/flutter-practice/tree/topic/tests/unit) |

### Architecture

| | Topic | Where |
|:---:|---|---|
| ✅ | SOLID | other projects |
| ✅ | Clean Architecture: domain, data and presentation layers | other projects |
| ✅ | Server-Driven UI: screens built from JSON configs | other projects |
| ✅ | Feature-first and layer-first folder structure | other projects |

Cubit, AutoRoute, Dio, Secure Storage, Shared Preferences and feature-first layers can be seen in [flutter-shelf-auth-module](https://github.com/TrusTa01/flutter-shelf-auth-module).

## What's covered

**Dart.** [`dart/basics`](https://github.com/TrusTa01/flutter-practice/tree/dart/basics) has one file per language feature: null safety, classes and OOP, mixins, enums, `copyWith`, error handling, and then async code, generics, extensions and isolates. [`dart/codewars-tasks`](https://github.com/TrusTa01/flutter-practice/tree/dart/codewars-tasks) holds 16 solved Codewars kata (ten 8 kyu, six 7 kyu). [`dart/small-projects`](https://github.com/TrusTa01/flutter-practice/tree/dart/small-projects) is a set of console games and tools: a calculator, a currency converter, a quiz, guess the number and rock-paper-scissors.

**Flutter UI.** [`flutter/basics`](https://github.com/TrusTa01/flutter-practice/tree/flutter/basics) starts with layouts and goes on to small apps: a counter, a calculator, a to-do list and two weather screens. [`flutter/features`](https://github.com/TrusTa01/flutter-practice/tree/flutter/features) is for trying one widget at a time; so far it is `CarouselView` in the default and `weighted` layouts.

**Mini-apps.** [`flutter/small-projects`](https://github.com/TrusTa01/flutter-practice/tree/flutter/small-projects) has two. A sign-up form validates every field and shows the entered data on the next screen. A contact book lets you add, open, edit and delete contacts (delete asks for confirmation), keeps the list in a Provider, moves between screens by named routes and loads extra users from JSONPlaceholder.

**State management.** The same ideas in four branches, from Flutter's own tools to libraries. [`native`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/native): `InheritedWidget`, `ChangeNotifier` and `ValueNotifier` without packages. [`provider`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/provider): an app of three screens on `MultiProvider`, `ChangeNotifierProvider`, `ProxyProvider` and `context.watch`. [`riverpod`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/riverpod): a small shop with a cart, the product list built with `@riverpod` code generation and the cart as a `Notifier`. [`state-management-root`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management-root) keeps the first versions of all of them in one place. BLoC and Cubit I learned on other projects; their branch [`bloc`](https://github.com/TrusTa01/flutter-practice/tree/topic/state-management/bloc) has only the topic outline.

**Navigation.** [`imperative`](https://github.com/TrusTa01/flutter-practice/tree/topic/navigation/imperative) covers `Navigator.push` and `pop`, a route table and `onGenerateRoute`, handing data to the next screen, and a bottom bar where each tab keeps its own `Navigator` stack. [`declarative`](https://github.com/TrusTa01/flutter-practice/tree/topic/navigation/declarative) does routing with `go_router`: a route with a path parameter, a `redirect` that depends on the login state, and a custom error page.

**Networking.** [`topic/networking`](https://github.com/TrusTa01/flutter-practice/tree/topic/networking) fetches data with `http` from three public sources: JSONPlaceholder, Open Brewery DB and Google's office list. Some models have `fromJson` written by hand, others are generated by `json_serializable`; the office list is parsed both ways for comparison.

**Local storage.** [`topic/local-storage`](https://github.com/TrusTa01/flutter-practice/tree/topic/local-storage) saves a text file to the app documents folder found with `path_provider` and reads it back.

**Localization.** An English and Russian app built on `flutter_localizations`, `intl` and ARB files, with a button that switches the language without a restart. [`localization-root`](https://github.com/TrusTa01/flutter-practice/tree/topic/localization-root) sets this up; the branches after it each add one kind of value. [`text`](https://github.com/TrusTa01/flutter-practice/tree/topic/localization/text): placeholders, plural forms and `select`. [`date`](https://github.com/TrusTa01/flutter-practice/tree/topic/localization/date): typed `DateTime` placeholders in the `yMd`, `yMMMMd` and `Hm` formats. [`currency`](https://github.com/TrusTa01/flutter-practice/tree/topic/localization/currency): integers, decimals, percentages and money written the way the current locale writes them.

**Tests.** [`topic/tests/unit`](https://github.com/TrusTa01/flutter-practice/tree/topic/tests/unit) has a calculator class and 6 `flutter_test` unit tests for it; one checks what happens on division by zero.

**Notes.** [`docs`](https://github.com/TrusTa01/flutter-practice/tree/docs) is plain-text notes I made while studying: a cheat sheet, async, and a guide to layouts.

## Running a branch

Requirements: Flutter SDK, an emulator or a phone.

```bash
git clone https://github.com/TrusTa01/flutter-practice.git
cd flutter-practice
git checkout topic/navigation/declarative
flutter pub get
flutter run
```

`flutter run` works as is where the branch has `lib/main.dart`: `provider`, `riverpod`, `declarative`, the four localization branches and `tests/unit`. In the other Flutter branches every example has its own `main()`, so name the file:

```bash
flutter run -t lib/first_projects/todo_list.dart   # flutter/basics
```

On GitHub you don't need to clone anything: open a branch from the branch menu or from the links above.

## Branch map

```
main                              # this README
├── dart/
│   ├── basics                    # language features, one file each
│   ├── codewars-tasks            # 16 kata
│   └── small-projects            # console programs
├── flutter/
│   ├── basics                    # layouts and first apps
│   ├── features                  # single widgets: CarouselView
│   └── small-projects            # sign-up form, contact book
├── topic/
│   ├── state-management-root     # first versions of the examples
│   ├── state-management/
│   │   ├── native                # InheritedWidget, ChangeNotifier, ValueNotifier
│   │   ├── provider
│   │   ├── riverpod              # shop with a cart, codegen
│   │   └── bloc                  # outline only, studied in other projects
│   ├── navigation/
│   │   ├── imperative            # Navigator, named and nested routes
│   │   └── declarative           # go_router
│   ├── networking                # http, json_serializable
│   ├── local-storage             # path_provider
│   ├── localization-root         # setup, EN and RU
│   ├── localization/
│   │   ├── text
│   │   ├── date
│   │   └── currency
│   └── tests/unit                # 6 unit tests
└── docs                          # study notes
```
