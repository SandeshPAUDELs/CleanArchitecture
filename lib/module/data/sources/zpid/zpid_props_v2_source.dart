import 'dart:convert';

import 'package:clean_arch/module/data/models/Zpid/zpid_property_models.dart';
import 'package:http/http.dart' as http;

abstract class ZpidPropsV2DataSource {
  Future<List<ZpidPropertyModels>> fetchZpidPropsV2(String zpid);
}

class ZpidPropsV2SourceImpl extends ZpidPropsV2DataSource {
  final String baseUrl = "https://zillow56.p.rapidapi.com/propertyV2";
  final Map<String, String> headers = {
    'X-RapidAPI-Key': 'aeae6df08cmshbac9f3fe15ccecdp104079jsn4dcae9797613',
    'X-RapidAPI-Host': 'zillow56.p.rapidapi.com',
  };
  @override
Future<List<ZpidPropertyModels>> fetchZpidPropsV2(String zpid) async {
  final response = await http.get(
    Uri.parse('$baseUrl?zpid=$zpid'),
    headers: headers,
  );

  if (response.statusCode == 200) {
    print(response.body); // Debugging: Print the API response
    final Map<String, dynamic> data = json.decode(response.body);

    // Parse the single property object
    final property = ZpidPropertyModels.fromJson(data);

    // Return a list containing the single property
    return [property];
  } else if (response.statusCode == 401) {
    throw Exception('Unauthorized');
  } else {
    throw Exception('Failed to load properties');
  }
}
  // @override 
  // Future<List<ZpidPropertyModels>> fetchZpidPropsV2(String zpid) async {
  //   final response = await http.get(
  //     Uri.parse('$baseUrl?zpid=$zpid'),
  //     headers: headers,
  //   );

  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     final data = json.decode(response.body);
  //     final List<dynamic> results = data['results'];
  //     return results.map((json) => ZpidPropertyModels.fromJson(json)).toList();
  //   } 
  //   else if (response.statusCode == 401) {
  //     throw Exception('Unauthorized');
  //   } 
  //   else {
  //     throw Exception('Failed to load properties');
  //   }
  // }

}