
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_event.dart';
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_state.dart';
import 'package:clean_arch/module/domain/usecases/search_props_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPropertiesBloc extends Bloc<FetchSearchProperties, SearchPropertiesState> {
  final SearchPropsUsecases searchPropsUsecases;

  SearchPropertiesBloc({required this.searchPropsUsecases}) : super(SearchPropertiesInitial()) {
    on<FetchSearchProperties>((event, emit) async {
      emit(SearchPropertiesLoading());
      try {
        final searchProperties = await searchPropsUsecases(event.location);
        emit(SearchPropertiesLoaded(searchProperties: searchProperties));
      } catch (e) {
        emit(SearchPropertiesError(message: e.toString()));
      }
    });
  }
}