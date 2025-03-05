import 'package:clean_arch/module/domain/entities/zpid/propertyV2/photos_property_entities.dart';
import 'package:clean_arch/module/domain/repositories/photo_property_repo.dart';

class PhotoPropertyUsecases {
  final PhotoPropertyRepo repository;
  PhotoPropertyUsecases({required this.repository});
  Future<List<PhotosEntities>> call(String zpid) async {
    return await repository.getPhotoProperties(zpid);
  }
}