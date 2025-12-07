// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUser _$ApiUserFromJson(Map<String, dynamic> json) => ApiUser(
      userId: json['id'] as int,
      name: json['name'] as String,
      surname: json['username'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ApiUserToJson(ApiUser instance) => <String, dynamic>{
      'id': instance.userId,
      'name': instance.name,
      'username': instance.surname,
      'phone': instance.phone,
    };