import 'dart:convert';

import 'package:clean_arch/module/data/models/Zpid/photos_property_models.dart';
import 'package:http/http.dart' as http;

abstract class PhotoPropertySource {
  Future<List<PhotosModels>> getPhotoProperties(String zpid);
}

class PhotoPropertySourceImpl implements PhotoPropertySource {
  final String baseUrl = "https://zillow56.p.rapidapi.com/photos";
  final Map<String, String> headers = {
    'X-RapidAPI-Key': '90e84c20fdmsha89ac49f7b3c9dap102541jsn2134949ee596',
    'X-RapidAPI-Host': 'zillow56.p.rapidapi.com',
  };

  @override
  Future<List<PhotosModels>> getPhotoProperties(String zpid) async {
    final response = await http.get(
      Uri.parse('$baseUrl?zpid=$zpid'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> photos = data['photos'];
      return photos.map((photo) => PhotosModels.fromJson(photo)).toList();
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to load properties');
    }
  }
}
