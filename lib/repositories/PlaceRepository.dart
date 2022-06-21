import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_hiring_dot/models/place.dart';

class PlaceRepository {
  Future<List<Place>?> getPlace() async {
    final response =
        await http.get(Uri.parse('https://dot-mobile-test.web.app/place.json'));

    if (response.statusCode == 200) {
      final jsonResult = jsonDecode(response.body)['data']['content'] as List;
      final result = jsonResult
          .cast<Map<String, dynamic>>()
          .map((json) => Place.fromJson(json))
          .toList();
      return result;
    }
    return null;
  }
}
