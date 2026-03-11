# State Management: Provider

This branch demonstrates state management and dependency injection using the **Provider** package. It is the most widely recommended approach by the Flutter team for building scalable applications.

## Technologies

- **Library:** `provider`
- **Pattern:** Dependency Injection (DI) & Observer Pattern

## Key Concepts & Implementations

- **MultiProvider**: centralized management of multiple data models at the root of the app.
- **ChangeNotifierProvider**: connecting business logic classes (`ChangeNotifier`) to the widget tree.
- **ProxyProvider**: managing providers that depend on other providers.
- **Consumer & Selector**: Ootimizing UI rebuilds by listening to specific data changes.
- **context.watch vs context.read**: understanding when to rebuild widgets and when to just trigger actions.

## Features Covered

- [x] Global and scoped state access.
- [x] Efficiently handling state updates without `setState`.
- [x] Using `Selector` for fine-grained performance optimization.
