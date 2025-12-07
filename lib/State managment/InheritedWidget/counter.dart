class Counter {
  Counter ([int value = 0]) : _value = value;

  int _value = 0;

  int get value => _value;

  void increment() {
    _value++;
  }

  void decrement() {
    _value--;
  }

  Counter copyWith({int? value}) {
    return Counter(
      _value = value ?? _value,
    );
  }
}