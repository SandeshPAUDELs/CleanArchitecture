import 'package:clean_arch/module/domain/entities/properties/search_prop_entity.dart';
import 'package:equatable/equatable.dart';

class SearchPropertiesState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchPropertiesInitial extends SearchPropertiesState{}
class SearchPropertiesLoading extends SearchPropertiesState{}
class SearchPropertiesLoaded extends SearchPropertiesState{
  final List<SearchPropertyEntities> searchProperties;
  SearchPropertiesLoaded({required this.searchProperties});
  @override
  List<Object?> get props => [searchProperties];

}
class SearchPropertiesError extends SearchPropertiesState{
  final String message;
  SearchPropertiesError({required this.message});
  @override
  List<Object?> get props => [message];
}