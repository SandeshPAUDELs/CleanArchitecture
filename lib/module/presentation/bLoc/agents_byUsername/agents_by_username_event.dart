import 'package:equatable/equatable.dart';

class AgentsByUsernameEvent extends Equatable{
  const AgentsByUsernameEvent();
  @override
  List<Object> get props => [];
}
class FetchAgentsByUsernameEvent extends AgentsByUsernameEvent{
  final String username;
  const FetchAgentsByUsernameEvent({required this.username});
  @override
  List<Object> get props => [username];
}