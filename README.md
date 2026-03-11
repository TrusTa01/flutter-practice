# State Management: Riverpod

This branch demonstrates state management using **Riverpod** - a reactive caching framework and a complete rewrite of the Provider pattern. It addresses many limitations of the original Provider, such as compile-time safety and dependency on the widget tree.

## Technologies

- **Library:** `flutter_riverpod`
- **Features:** compile-safety, no BuildContext needed for logic, testability

## Key Concepts & Implementations

- **ProviderScope**: proper initialization at the root of the application.
- **ConsumerWidget & ConsumerStatefulWidget**: integrating providers into the UI layer.
- **AsyncNotifier & FutureProvider**: handling asynchronous data (API calls) with built-in error/loading states.
- **StateProvider & Notifier**: managing simple and complex state mutations.
