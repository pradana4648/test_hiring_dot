import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_hiring_dot/models/user.dart';

class UserRepository {
  Future<User> getUser() async {
    final response =
        await http.get(Uri.parse('https://dot-mobile-test.web.app/user.json'));

    // If status code ok
    if (response.statusCode == 200) {
      final jsonResult = jsonDecode(response.body) as Map<String, dynamic>;
      final user = User.fromJson(jsonResult['data']);
      return user;
    }
    return const User();
  }
}
