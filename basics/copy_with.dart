void main() {
  const sanya = Human(name: 'Саша', age: 23, height: 190);
  final kostya = sanya.copyWith(name: 'Костя');

  print(sanya.nameAndAge);
  print(kostya.nameAndAge);
}

class Human {
  const Human({required this.name, required this.age, required this.height});

  final String name;
  final int age;
  final double height;

  String get nameAndAge => '$name:$age';

  Human copyWith({String? name, int? age, double? height}) {
    return Human(
      name: name ?? this.name,
      age: age ?? this.age,
      height: height ?? this.height,
    );
  }
}
