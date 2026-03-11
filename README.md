# Flutter & Dart Learning Journey

This repository is a structured log of my progress in mastering mobile development. To keep the codebase organized, each topic and project category is separated into its own dedicated branch.

## Repository Map

### Flutter

- `flutter/basics` — Core widgets, layouts, and UI practice.
- `flutter/features` — Isolated feature tests (e.g., CarouselView, animations).
- `flutter/small-projects` — Mini-apps (User Form, Contact List, etc.).
- `topic/state-management` — Directory for state management patterns:
  - `topic/state-management/native` — InheritedWidget, ChangeNotifier & ValueNotifier.
  - `topic/state-management/provider` — Industry standard dependency injection.
  - `topic/state-management/riverpod` — Modern, compile-safe reactive caching.
  - `topic/state-management/bloc` — Event-driven architecture with BLoC & Cubit.
- `topic/networking` — API integration, Dio, and JSON serialization.
- `topic/navigation` — Routing systems (Navigator 1.0/2.0, GoRouter).
- `topic/local-storage` — Persistence (Hive, Shared Preferences, SQLite).

### Dart

- `dart/basics` — Language fundamentals and syntax.
- `dart/codewars-tasks` — Solutions for algorithmic challenges.
- `dart/small-projects` — Pure Dart console applications and logic tests.

### Other

- `docs` — Additional documentation and learning resources.

## Current Progress:

### Skills & Knowledge Base

- **UI & Layout Basics**
  - [x] Complex ListView & GridView implementations
  - [x] Custom Slivers and Scroll physics
  - [x] Responsive & Adaptive design principles
- **State Management**
  - [x] **InheritedWidget**: Deep dive into low-level Flutter state propagation (Under the hood)
  - [x] **ChangeNotifier**: Completed basic reactive patterns
  - [x] **Provider**: MultiProvider, ProxyProvider, and selective rebuilds
  - [x] **ValueNotifier**: Lightweight UI updates using built-in tools
  - [ ] **Riverpod**: (In Progress) Exploring AsyncNotifier and Providers
- **Networking & API Integration**
  - [x] **HTTP Basics**: Basic requests and status handling
  - [x] **JSON Serialization**: Manual & Code Generation (json_serializable)
  - [ ] **Dio**: (Planned) Advanced interceptors and network layers
- **Local Data Storage**
  - [ ] **Shared Preferences**: (In Progress) Storing simple key-value pairs
  - [ ] **Database**: Deep dive into `Hive` or `Isar` for NoSQL local storage
- **Navigation & Routing**
  - [x] **Navigator 1.0**: Basic imperative routing
  - [ ] **Navigator 2.0**: Declarative routing for complex flows
  - [ ] **GoRouter**: Managing deep links and nested navigation
- **Architecture & Best Practices**
  - [x] **SOLID Principles**: Applying Object-Oriented Design for scalable code
  - [x] **Clean Architecture Principles**: Applied to Domain, Data, and Presentation layers
  - [x] **Server-Driven UI (SDUI)**: Building dynamic layouts via JSON configs
  - [x] **Folder Structure**: Feature-first and Layer-first organization

_How to use: Switch to a specific branch using `git checkout <branch_name>` to explore the code._

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=flat&logo=dart&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=flat&logo=git&logoColor=white)
