import 'package:json_annotation/json_annotation.dart';

part 'api_user.g.dart';

class ApiUser {
  @JsonKey(name: 'id')
  final int userId;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'username')
  final String surname;

  @JsonKey(name: 'phone')
  final String phone;
  ApiUser({
    required this.userId,
    required this.name,
    required this.surname,
    required this.phone,
  });

  factory ApiUser.fromJson(Map<String, dynamic> json) =>
      _$ApiUserFromJson(json);
  Map<String, dynamic> toJson() => _$ApiUserToJson(this);
}
