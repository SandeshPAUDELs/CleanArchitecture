import 'package:clean_arch/module/domain/entities/zpid/propertyV2/zpid_property_entities.dart';
import 'package:equatable/equatable.dart';

class ZpidPropertiesV2State extends Equatable{
  @override
  List<Object?> get props => [];
}

class ZpidPropertiesV2Initial extends ZpidPropertiesV2State{}
class ZpidPropertiesV2Loading extends ZpidPropertiesV2State{}
class ZpidPropertiesV2Loaded extends ZpidPropertiesV2State{
  final List<ZPIDPropertyEntities> zpidProperties;
  ZpidPropertiesV2Loaded({required this.zpidProperties});
  @override
  List<Object?> get props => [zpidProperties];

}
class ZpidPropertiesV2Error extends ZpidPropertiesV2State{
  final String message;
  ZpidPropertiesV2Error({required this.message});
  @override
  List<Object?> get props => [message];
}
