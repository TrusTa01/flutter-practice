# State Management: BLoC & Cubit

This branch focuses on the **BLoC (Business Logic Component)** pattern, which helps separate the presentation layer from business logic using events and states.

## Technologies

- **Library:** `flutter_bloc`
- **Architecture:** Event-State mapping

## Features & Concepts

- **Cubit**: Simple state management for straightforward logic (methods trigger state changes).
- **BLoC**: Advanced state management using asynchronous events and streams.
- **BlocBuilder & BlocListener**: Efficient UI updates and side-effect handling (snackbars, navigation).
- **BlocProvider**: Dependency injection for providing blocs to the widget tree.

## Key Skills Demonstrated

- [x] Defining clear `Event` and `State` classes (using `equatable` for value comparison).
- [x] Managing complex UI states (Loading, Success, Failure).
- [x] Transforming data streams within the business logic layer.
