import 'package:clean_arch/module/domain/entities/zpid/propertyV2/photos_property_entities.dart';

abstract class PhotoPropertyRepo {
  Future<List<PhotosEntities>> getPhotoProperties(String zpid);
}