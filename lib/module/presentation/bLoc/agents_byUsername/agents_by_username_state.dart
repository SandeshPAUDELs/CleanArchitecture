import 'package:clean_arch/module/domain/entities/agents/agent_by_username_entities.dart';
import 'package:equatable/equatable.dart';

class AgentsByUsernameState extends Equatable{
  @override
  List<Object?> get props => [];
}

class AgentsByUsernameInitial extends AgentsByUsernameState{}
class AgentsByUsernameLoading extends AgentsByUsernameState{}
class AgentsByUsernameLoaded extends AgentsByUsernameState{
  final List<AgentByUsernameEntities> agentsByUsername;
  AgentsByUsernameLoaded({required this.agentsByUsername});
  @override
  List<Object?> get props => [agentsByUsername];

}
class AgentsByUsernameError extends AgentsByUsernameState{
  final String message;
  AgentsByUsernameError({required this.message});
  @override
  List<Object?> get props => [message];
}