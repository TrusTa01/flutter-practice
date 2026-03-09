// class Brewery {
//   final String id;
//   final String name;
//   final String breweryType;
//   final String country;
//   final String city;
//   final String? phone;
//   Brewery({
//     required this.id,
//     required this.name,
//     required this.breweryType,
//     required this.country,
//     required this.city,
//     required this.phone,
//   });

//   factory Brewery.fromJson(Map<String, dynamic> json) {
//     return Brewery(
//       id: json['id'] as String,
//       name: json['name'] as String,
//       breweryType: json['brewery_type'] as String,
//       country: json['country'] as String,
//       city: json['city'] as String,
//       phone: json['phone'] as String,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id' : id,
//       'name' : name,
//       'brewery_type' : breweryType,
//       'country' : country,
//       'city' : city,
//       'phone' : phone,
//     };
//   }
// }

import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Brewery {
  final String? id;
  final String? name;
  final String? breweryType;
  final String? country;
  final String? city;
  final String? phone;
  Brewery({
    required this.id,
    required this.name,
    required this.breweryType,
    required this.country,
    required this.city,
    required this.phone,
  });

  factory Brewery.fromJson(Map<String, dynamic> json) => _$BreweryFromJson(json);

  Map<String, dynamic> toJson() => _$BreweryToJson(this);
}