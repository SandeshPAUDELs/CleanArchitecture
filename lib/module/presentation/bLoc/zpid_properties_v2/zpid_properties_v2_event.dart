import 'package:equatable/equatable.dart';

abstract class ZpidPropertiesV2Event extends Equatable{
  const ZpidPropertiesV2Event();
  @override
  List<Object?> get props => [];
}
class FetchZpidPropertiesV2 extends ZpidPropertiesV2Event{
  final String zpid; 
  const FetchZpidPropertiesV2({required this.zpid});
  @override
  List<Object?> get props => [zpid];
}