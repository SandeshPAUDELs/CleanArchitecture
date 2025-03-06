import 'package:clean_arch/module/data/sources/agents/search_agents_source.dart';
import 'package:clean_arch/module/domain/entities/agents/search_agent_entities.dart';
import 'package:clean_arch/module/domain/repositories/search_agent_repo.dart';

class SearchAgentRepoImpl extends SearchAgentRepo {
  final SearchAgentsDataSource dataSource;
  SearchAgentRepoImpl(this.dataSource);
  
  @override
  Future <List<SearchAgentEntities>> getSearchAgent(String location) async {
    final searchAgents = await dataSource.fetchSearchAgents(location);
    return searchAgents.map((agent) => SearchAgentEntities(
      businessName: agent.businessName,
      encodedZuid: agent.encodedZuid,
      fullName: agent.fullName,
      numTotalReviews: agent.numTotalReviews,
      profilePhotoSrc: agent.profilePhotoSrc,
      phoneNumber: agent.phoneNumber,
    )).toList(); 
  }
}