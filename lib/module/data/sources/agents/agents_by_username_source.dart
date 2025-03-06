import 'dart:convert';
import 'package:clean_arch/module/data/models/agents/search_byusername_models.dart';
import 'package:http/http.dart' as http;

abstract class AgentsByUsernameSource {
  Future<AgentByUsernameModels> fetchAgentByUsername(String username);
}

class AgentsByUsernameSourceImpl extends AgentsByUsernameSource {
  final String baseUrl = "https://zillow56.p.rapidapi.com/agent";
  final Map<String, String> headers = {
    'X-RapidAPI-Key': 'f57770540fmsh1f74affde05a581p1e08d9jsnf0a2dd66235f',
    'X-RapidAPI-Host': 'zillow56.p.rapidapi.com',
  };

  @override
  Future<AgentByUsernameModels> fetchAgentByUsername(String username) async {
    final response = await http.get(
      Uri.parse('$baseUrl?username=$username'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      return AgentByUsernameModels.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to load agents');
    }
  }
}