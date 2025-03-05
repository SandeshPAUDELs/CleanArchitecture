import 'dart:convert';

import 'package:clean_arch/module/data/models/Zpid/zpid_property_models.dart';
import 'package:http/http.dart' as http;

abstract class ZpidPropsV2DataSource {
  Future<List<ZpidPropertyModels>> fetchZpidPropsV2(String zpid);
}

class ZpidPropsV2SourceImpl extends ZpidPropsV2DataSource {
  final String baseUrl = "https://zillow56.p.rapidapi.com/propertyV2";
  final Map<String, String> headers = {
    'X-RapidAPI-Key': 'b473dbb3d6msh16152b477050dffp18a13cjsn2e8a176321a1',
    'X-RapidAPI-Host': 'zillow56.p.rapidapi.com',
  };
  @override
  Future<List<ZpidPropertyModels>> fetchZpidPropsV2(String zpid) async {
    final response = await http.get(
      Uri.parse('$baseUrl?zpid=$zpid'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      final property = ZpidPropertyModels.fromJson(data);
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
