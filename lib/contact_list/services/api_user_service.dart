import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_default/contact_list/models/api_user.dart';

class ApiUserService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<ApiUser>> getApiUsers() async {
    final url = Uri.parse('$_baseUrl/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ApiUser.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  }
}
