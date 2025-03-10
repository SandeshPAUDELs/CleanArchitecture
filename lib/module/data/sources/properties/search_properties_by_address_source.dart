import 'dart:convert';
import 'package:clean_arch/module/data/models/properties/search_by_address_props_models.dart';
import 'package:http/http.dart' as http;

abstract class SearchPropertiesByAddressDataSource {
  Future<List<SearchProprtiedByAddressProperyModels>> fetchSearchByAddress(
      String address);
}

class SearchPropertiesByAddressDataSourceImpl
    extends SearchPropertiesByAddressDataSource {
  final String baseUrl = "https://zillow56.p.rapidapi.com/search_address";

  final Map<String, String> headers = {
    'X-RapidAPI-Key': '90e84c20fdmsha89ac49f7b3c9dap102541jsn2134949ee596',
    'X-RapidAPI-Host': 'zillow56.p.rapidapi.com',
  };
  @override
  Future<List<SearchProprtiedByAddressProperyModels>> fetchSearchByAddress(
      String address) async {
    final response = await http.get(
      Uri.parse('$baseUrl?address=$address'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      final data = json.decode(response.body);
      return [SearchProprtiedByAddressProperyModels.fromJson(data)];

      // final List<dynamic> results = data['results'];
      // return results.map((json) => SearchProprtiedByAddressProperyModels.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to load properties');
    }
  }
}
