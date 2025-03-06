import 'package:clean_arch/module/domain/entities/agents/search_agent_entities.dart';

abstract class SearchAgentRepo{
  Future<List<SearchAgentEntities>> getSearchAgent(String location);
}