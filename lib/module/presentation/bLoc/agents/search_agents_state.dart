import 'package:clean_arch/module/domain/entities/agents/search_agent_entities.dart';
import 'package:equatable/equatable.dart';

class SearchAgentsState extends Equatable{
  @override
  List<Object> get props => [];
}
class SearchAgentsInitial extends SearchAgentsState{}
class SearchAgentsLoading extends SearchAgentsState{}
class SearchAgentsLoaded extends SearchAgentsState{
  final List<SearchAgentEntities> searchAgents;
  SearchAgentsLoaded({required this.searchAgents});
  @override
  List<Object> get props => [searchAgents];
}
class SearchAgentsError extends SearchAgentsState{
  final String message;
  SearchAgentsError({required this.message});
  @override
  List<Object> get props => [message];
}