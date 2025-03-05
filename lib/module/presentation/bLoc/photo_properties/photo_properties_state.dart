import 'package:clean_arch/module/domain/entities/zpid/propertyV2/photos_property_entities.dart';
import 'package:equatable/equatable.dart';

class PhotoPropertiesState extends Equatable{
  @override
  List<Object?> get props => [];
}

class PhotoPropertiesInitial extends PhotoPropertiesState{}
class PhotoPropertiesLoading extends PhotoPropertiesState{}
class PhotoPropertiesLoaded extends PhotoPropertiesState{
  final List<PhotosEntities> photoProperties;
  PhotoPropertiesLoaded({required this.photoProperties});
  @override
  List<Object?> get props => [photoProperties];

}
class PhotoPropertiesError extends PhotoPropertiesState{
  final String message;
  PhotoPropertiesError({required this.message});
  @override
  List<Object?> get props => [message];
}