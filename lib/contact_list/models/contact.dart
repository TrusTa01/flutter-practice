import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

class Contact {
  final String id;
  final String _name;
  final String _surname;
  final String _phone;

  Contact({
    required String name,
    required String surname,
    required String phone,
  }) : id = uuid.v4(),
       _name = name,
       _surname = surname,
       _phone = phone;

  String get name => _name;
  String get surname => _surname;
  String get phone => _phone;

  Contact copyWith({String? name, String? surname, String? phone}) {
    return Contact(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
    );
  }
}
