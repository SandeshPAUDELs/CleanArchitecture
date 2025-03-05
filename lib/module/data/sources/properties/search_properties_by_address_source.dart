import 'dart:convert';
import 'package:clean_arch/module/data/models/properties/search_by_address_props_models.dart';
import 'package:http/http.dart' as http;

abstract class SearchPropertiesByAddressDataSource {
  Future<List<SearchProprtiedByAddressProperyModels>> fetchSearchByAddress(String address);
}
class SearchPropertiesByAddressDataSourceImpl extends SearchPropertiesByAddressDataSource {
  final String baseUrl = "https://zillow56.p.rapidapi.com/search_address";

  final Map<String, String> headers = {
    'X-RapidAPI-Key': 'aeae6df08cmshbac9f3fe15ccecdp104079jsn4dcae9797613', 
    'X-RapidAPI-Host': 'zillow56.p.rapidapi.com',
  };
  @override
  Future<List<SearchProprtiedByAddressProperyModels>> fetchSearchByAddress(String address) async {
    final response = await http.get(
      Uri.parse('$baseUrl?address=$address'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => SearchProprtiedByAddressProperyModels.fromJson(json)).toList();
    } 
    // if (data is Map<String, dynamic> && data.containsKey('results') && data['results'] is List) {
    //     final List<dynamic> results = data['results'];
    //     return results.map((json) => SearchProprtiedByAddressProperyModels.fromJson(json)).toList();
    //   } else {
    //     print("Warning: 'results' key is missing or not a list");
    //     return []; // Return an empty list instead of throwing an error
    //   }
    else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    }
    else {
      throw Exception('Failed to load properties');
    }
  }

}

