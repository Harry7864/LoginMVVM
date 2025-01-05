import 'dart:convert';

import 'package:demo_task/models/country_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://freetestapi.com/api/v1/countries";

  Future<List<Country>> fetchCountries(int page, int limit) async {

    final response = await http.get(Uri.parse('$baseUrl'));
    if (response.statusCode == 200) {
      List<dynamic> countryData = jsonDecode(response.body);
      return countryData.map((item) => Country.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load countries");
    }
  }
}
