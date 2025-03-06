import 'package:clean_arch/module/domain/usecases/search_agent_usecases.dart';
import 'package:clean_arch/module/presentation/bLoc/agents/search_agents_state.dart';
import 'package:clean_arch/module/presentation/bLoc/agents/serach_agents_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAgentsBloc extends Bloc<SerachAgentsEvents, SearchAgentsState>{
  final SearchAgentUsecases searchAgentUsecases;
  SearchAgentsBloc({required this.searchAgentUsecases}) : super(SearchAgentsInitial()){
    on<FetchSearchAgentsEvents>((event, emit) async {
      emit(SearchAgentsLoading());
      try {
        
        final searchAgents = await searchAgentUsecases.searchAgent(event.location);
        emit(SearchAgentsLoaded(searchAgents: searchAgents));
      } catch (e) {
        emit(SearchAgentsError(message: e.toString()));
      }
    });
  }
}