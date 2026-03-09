// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brewery _$BreweryFromJson(Map<String, dynamic> json) => Brewery(
  id: json['id'] as String?,
  name: json['name'] as String?,
  breweryType: json['breweryType'] as String?,
  country: json['country'] as String?,
  city: json['city'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$BreweryToJson(Brewery instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'breweryType': instance.breweryType,
  'country': instance.country,
  'city': instance.city,
  'phone': instance.phone,
};
