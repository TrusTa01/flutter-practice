class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

// ФАБРИЧНЫЙ КОНСТРУКТОР fromJson - для преобразования JSON в объект User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }

// МЕТОД toJson - для преобразования объекта User в JSON (на будущее)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
    };
  }
}
