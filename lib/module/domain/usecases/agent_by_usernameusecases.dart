import 'package:clean_arch/module/domain/entities/agents/agent_by_username_entities.dart';
import 'package:clean_arch/module/domain/repositories/agent_by_username_repo.dart';

class AgentByUsernameusecases {
  final AgentByUsernameRepo repository;
  AgentByUsernameusecases({required this.repository});
  Future<List<AgentByUsernameEntities>> call(String username) async {
    return await repository.getAgentByUsername(username);
  }
}