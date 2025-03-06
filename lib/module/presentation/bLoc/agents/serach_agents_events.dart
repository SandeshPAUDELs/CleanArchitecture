import 'package:equatable/equatable.dart';

class SerachAgentsEvents extends Equatable{
  const SerachAgentsEvents();
  @override
  List<Object> get props => [];
}
class FetchSearchAgentsEvents extends SerachAgentsEvents{
  final String location;
  const FetchSearchAgentsEvents({required this.location});
  @override
  List<Object> get props => [location];
}