void main() {
  final storageInt = Storage<int>(34);
  storageInt.update(4);

  print(storageInt.read());

  final storageString = Storage<String>('dssdsd');
  storageString.update('223erfe');

  print(storageString.read());
}

class Storage<T> {
  T value;

  Storage(this.value);

  T read() => value;

  void update(T value) {
    this.value = value;
  }
}
