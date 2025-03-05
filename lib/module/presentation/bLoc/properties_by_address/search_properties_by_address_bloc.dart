import 'package:clean_arch/module/domain/usecases/search_props_by_address_usecases.dart';
import 'package:clean_arch/module/presentation/bLoc/properties_by_address/search_properties_by_address_event.dart';
import 'package:clean_arch/module/presentation/bLoc/properties_by_address/search_properties_by_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPropertiesByAddressBloc extends Bloc<FetchSearchPropertiesByAddress, SearchPropertiesByAddressState> {
  final SearchPropsByAddressUsecases searchPropsByAddressUsecases;
  SearchPropertiesByAddressBloc({required this.searchPropsByAddressUsecases}) : super(SearchPropertiesByAddressInitial()) {
    on<FetchSearchPropertiesByAddress>((event, emit) async {
      emit(SearchPropertiesByAddressLoading());
      try {
        final searchProperties = await searchPropsByAddressUsecases(event.address);
        emit(SearchPropertiesByAddressLoaded(searchProperties: searchProperties));
      } catch (e) {
        emit(SearchPropertiesByAddressError(message: e.toString()));
      }
    });
  }

}