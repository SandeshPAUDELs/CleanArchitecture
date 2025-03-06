import 'dart:convert';
import 'package:clean_arch/module/data/models/agents/search_agent_models.dart';
import 'package:http/http.dart' as http;

abstract class SearchAgentsDataSource {
  Future<List<SearchAgentModels>> fetchSearchAgents(String location);
}

class SearchAgentsDataSourceImpl extends SearchAgentsDataSource {
  final String baseUrl = "https://zillow56.p.rapidapi.com/search_agents";

  final Map<String, String> headers = {
    'X-RapidAPI-Key': 'b473dbb3d6msh16152b477050dffp18a13cjsn2e8a176321a1',
    'X-RapidAPI-Host': 'zillow56.p.rapidapi.com',
  };
  @override
  Future<List<SearchAgentModels>> fetchSearchAgents(String location) async {
    final response = await http.get(
      Uri.parse('$baseUrl?location=$location'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      print(response.body);
      final List<dynamic> data = json.decode(response.body);
      if (data.isEmpty) {
        return [];
      }
      return data.map((json) => SearchAgentModels.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to load agents');
    }
  }
}
