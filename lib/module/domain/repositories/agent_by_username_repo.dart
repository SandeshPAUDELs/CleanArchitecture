import 'package:clean_arch/module/domain/entities/agents/agent_by_username_entities.dart';
abstract class AgentByUsernameRepo {
  Future<List<AgentByUsernameEntities>> getAgentByUsername(String username);
}