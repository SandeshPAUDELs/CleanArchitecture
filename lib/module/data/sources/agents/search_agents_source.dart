// import 'dart:convert';
// import 'package:clean_arch/module/data/models/agents/search_agent_models.dart';
// import 'package:http/http.dart' as http;

// abstract class SearchAgentsDataSource {
//   Future<List<SearchAgentModels>> fetchSearchAgents(String location);
// }

// class SearchAgentsDataSourceImpl extends SearchAgentsDataSource {
//   final String baseUrl = "https://zillow56.p.rapidapi.com/search_agents";

//   final Map<String, String> headers = {
//     'X-RapidAPI-Key': '90e84c20fdmsha89ac49f7b3c9dap102541jsn2134949ee596',
//     'X-RapidAPI-Host': 'zillow56.p.rapidapi.com',
//   };
//   @override
//   Future<List<SearchAgentModels>> fetchSearchAgents(String location) async {
//     final response = await http.get(
//       Uri.parse('$baseUrl?location=$location'),
//       headers: headers,
//     );
//     if (response.statusCode == 200) {
//       print(response.body);
//       final List<dynamic> data = json.decode(response.body);
//       if (data.isEmpty) {
//         return [];
//       }
//       return data.map((json) => SearchAgentModels.fromJson(json)).toList();
//     } else if (response.statusCode == 401) {
//       throw Exception('Unauthorized');
//     } else {
//       throw Exception('Failed to load agents');
//     }
//   }
// }
import 'dart:convert';
import 'package:clean_arch/module/data/models/agents/search_agent_models.dart';
import 'package:http/http.dart' as http;

abstract class SearchAgentsDataSource {
  Future<List<SearchAgentModels>> fetchSearchAgents(String location);
}

class SearchAgentsDataSourceImpl implements SearchAgentsDataSource {
  final http.Client _client;
  final String baseUrl = "https://zillow56.p.rapidapi.com/search_agents";

  final Map<String, String> headers = {
    'X-RapidAPI-Key': '90e84c20fdmsha89ac49f7b3c9dap102541jsn2134949ee596',
    'X-RapidAPI-Host': 'zillow56.p.rapidapi.com',
  };

  SearchAgentsDataSourceImpl(this._client);

  @override
  Future<List<SearchAgentModels>> fetchSearchAgents(String location) async {
    final Uri url = Uri.parse('$baseUrl?location=$location');

    final http.Response response = await _client.get(url, headers: headers);

    if (response.statusCode == 200) {
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
