import 'package:clean_arch/module/domain/usecases/agent_by_usernameusecases.dart';
import 'package:clean_arch/module/presentation/bLoc/agents_byUsername/agents_by_username_event.dart';
import 'package:clean_arch/module/presentation/bLoc/agents_byUsername/agents_by_username_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgentsByUsernameBloc extends Bloc<AgentsByUsernameEvent, AgentsByUsernameState>{
  final AgentByUsernameusecases agentByUsernameusecases;
  AgentsByUsernameBloc({required this.agentByUsernameusecases}) : super(AgentsByUsernameInitial()){
    on<FetchAgentsByUsernameEvent>((event, emit) async {
      emit(AgentsByUsernameLoading());
      try {
        final agentsByUsername = await agentByUsernameusecases(event.username);
        emit(AgentsByUsernameLoaded(agentsByUsername: agentsByUsername));
      } catch (e) {
        emit(AgentsByUsernameError(message: e.toString()));
      }
    });
  }
}