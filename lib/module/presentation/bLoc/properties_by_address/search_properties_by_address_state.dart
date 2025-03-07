import 'package:clean_arch/module/domain/entities/properties/search_by_address_props_entity.dart';
import 'package:equatable/equatable.dart';

class SearchPropertiesByAddressState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class SearchPropertiesByAddressInitial extends SearchPropertiesByAddressState{}
class SearchPropertiesByAddressLoading extends SearchPropertiesByAddressState{}
class SearchPropertiesByAddressLoaded extends SearchPropertiesByAddressState {
  final List<SearchPropertyByAddressEntities> searchProperties;
  SearchPropertiesByAddressLoaded({required this.searchProperties});

  @override
  List<Object?> get props => [searchProperties];
}
class SearchPropertiesByAddressError extends SearchPropertiesByAddressState{
  final String message;
  SearchPropertiesByAddressError({required this.message});
  @override
  List<Object?> get props => [message];
}

