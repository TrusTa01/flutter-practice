import 'dart:convert';
import 'package:http/http.dart' as http;

class OfficesList {
  List<Office> offices;
  OfficesList(this.offices);

  factory OfficesList.fromJson(Map<String, dynamic> json) {
    var officesJson = json['offices'] as List;

    List<Office> officesList = officesJson
        .map((i) => Office.fromJson(i))
        .toList();

    return OfficesList(officesList);
  }
}

class Office {
  final String name;
  final String address;
  final String image;
  Office(this.name, this.address, this.image);

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      json['name'] as String,
      json['address'] as String,
      json['image'] as String,
    );
  }
}

Future<OfficesList> getOfficesList() async {
  const url = 'https://about.google/static/data/locations.json';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return OfficesList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error ${response.statusCode}');
  }
}