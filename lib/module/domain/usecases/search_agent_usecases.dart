import 'package:clean_arch/module/domain/entities/agents/search_agent_entities.dart';
import 'package:clean_arch/module/domain/repositories/search_agent_repo.dart';

class SearchAgentUsecases {
  final SearchAgentRepo repository;

  SearchAgentUsecases({required this.repository});

  Future<List<SearchAgentEntities>> searchAgent(String location) async {
    return await repository.getSearchAgent(location);
  }
}