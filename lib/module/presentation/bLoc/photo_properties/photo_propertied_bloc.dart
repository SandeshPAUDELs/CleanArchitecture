import 'package:clean_arch/module/domain/usecases/photo_property_usecases.dart';
import 'package:clean_arch/module/presentation/bLoc/photo_properties/photo_properties_event.dart';
import 'package:clean_arch/module/presentation/bLoc/photo_properties/photo_properties_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoPropertiesBloc extends Bloc<PhotoPropertiesEvent, PhotoPropertiesState> {
  final PhotoPropertyUsecases photoPropertyUsecases;
  PhotoPropertiesBloc({required this.photoPropertyUsecases}) : super(PhotoPropertiesInitial()) {
    on<FetchPhotoPropertiesEvent>((event, emit) async {
      emit(PhotoPropertiesLoading());
      try {
        final photoProperties = await photoPropertyUsecases(event.zpid);
        emit(PhotoPropertiesLoaded(photoProperties: photoProperties));
      } catch (e) {
        emit(PhotoPropertiesError(message: e.toString()));
      }
    });
  }
}