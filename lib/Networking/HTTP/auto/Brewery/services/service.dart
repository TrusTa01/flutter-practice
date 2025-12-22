import 'package:flutter_application_default/Networking/HTTP/auto/Brewery/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BreweryService {
  static const String _baseUrl = 'https://api.openbrewerydb.org/v1/breweries';
  static Future<List<Brewery>> getBreweries() async {
    final url = Uri.parse('$_baseUrl');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Success! Breweries have been loaded!');
      final List<dynamic> jsonList = json.decode(response.body);

      List<Brewery> breweries = [];

      for (var jsonBrewery in jsonList) {
        Brewery brewery = Brewery.fromJson(jsonBrewery);
        breweries.add(brewery);
      }
      return breweries;
    } else {
      throw Exception('Failed to load breweries: ${response.statusCode}');
    }
  }
}