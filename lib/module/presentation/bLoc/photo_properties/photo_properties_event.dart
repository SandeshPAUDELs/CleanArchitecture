import 'package:equatable/equatable.dart';

abstract class PhotoPropertiesEvent extends Equatable {
  const PhotoPropertiesEvent();
  @override
  List<Object?> get props => [];
}
class FetchPhotoPropertiesEvent extends PhotoPropertiesEvent {
  final String zpid;
  const FetchPhotoPropertiesEvent({required this.zpid});
  @override
  List<Object?> get props => [zpid];
}