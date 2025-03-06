import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:clean_arch/module/data/models/properties/search_props_models.dart';

abstract class SearchPropertiesDataSource {
  Future<List<SearchPropertyModels>> fetchSearchProperties(String location);
}

class SearchPropertiesDataSourceImpl extends SearchPropertiesDataSource {
  final String baseUrl = "https://zillow56.p.rapidapi.com/search";

  final Map<String, String> headers = {
    'X-RapidAPI-Key': 'f57770540fmsh1f74affde05a581p1e08d9jsnf0a2dd66235f',
    'X-RapidAPI-Host': 'zillow56.p.rapidapi.com',
  };

  @override
  Future<List<SearchPropertyModels>> fetchSearchProperties(
      String location) async {
    final response = await http.get(
      Uri.parse('$baseUrl?location=$location'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results
          .map((json) => SearchPropertyModels.fromJson(json))
          .toList();
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to load properties');
    }
  }
}
