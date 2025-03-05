import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable{
  const SearchEvent();
  @override
  List<Object?> get props => [];

}
class FetchSearchProperties extends SearchEvent{
  final String location; 
  const FetchSearchProperties({required this.location});
  @override
  List<Object?> get props => [location];
}