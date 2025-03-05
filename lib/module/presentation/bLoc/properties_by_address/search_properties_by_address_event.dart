import 'package:equatable/equatable.dart';

abstract class SearchPropertiesByAddressEvent extends Equatable{
  const SearchPropertiesByAddressEvent();
  @override
  List<Object?> get props => [];
}
class FetchSearchPropertiesByAddress extends SearchPropertiesByAddressEvent{
  final String address; 
  const FetchSearchPropertiesByAddress({required this.address});
  @override
  List<Object?> get props => [address];
}