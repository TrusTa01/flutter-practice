# State Management: native flutter tools

This branch demonstrates how to manage state and propagate data using only built-in Flutter mechanisms. Mastering these "low-level" tools is essential for understanding how advanced libraries like Provider and Riverpod work under the hood.

## Technologies

- **Framework:** Flutter (Zero external dependencies)
- **Core Mechanisms:** InheritedWidget, ChangeNotifier, ValueNotifier

## What's Inside:

### 1. InheritedWidget

- **Concept:** passing data down the widget tree without "constructor drilling".
- **Implementation:** custom `of(context)` methods and `updateShouldNotify` logic to optimize rebuilds.
- **Goal:** understanding the fundamental way Flutter propagates information.

### 2. ChangeNotifier & Listenable

- **Concept:** using the Observer pattern to notify the UI about data changes.
- **Implementation:** creating custom controllers that encapsulate business logic and trigger `notifyListeners()`.

### 3. ValueNotifier & ValueListenableBuilder

- **Concept:** lightweight, granular state updates for specific values.
- **Implementation:** rebuilding only small parts of the UI (like a search query or a toggle) to maintain high performance.

## Key Skills Demonstrated

- [x] Deep understanding of the **Element Tree** and widget lookup.
- [x] Efficient memory management (proper use of `dispose`).
- [x] Building scalable state architectures without third-party packages.
- [x] Optimizing UI performance by minimizing widget rebuilds.
