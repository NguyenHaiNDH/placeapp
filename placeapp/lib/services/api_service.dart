import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/place.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8080/api/places';

  static Future<List<Place>> getAllPlaces() async {
    final response = await http.get(Uri.parse('$baseUrl/getAllPlace'));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Place.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load places');
    }
  }
}
