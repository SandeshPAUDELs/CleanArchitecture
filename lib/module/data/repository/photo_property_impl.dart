import 'package:clean_arch/module/data/sources/zpid/photo_property_source.dart';
import 'package:clean_arch/module/domain/entities/zpid/propertyV2/photos_property_entities.dart';
import 'package:clean_arch/module/domain/repositories/photo_property_repo.dart';

class PhotoPropertyRepoImpl extends PhotoPropertyRepo{
  final PhotoPropertySource dataSource;
  PhotoPropertyRepoImpl(this.dataSource);

  @override
  Future<List<PhotosEntities>> getPhotoProperties(String zpid) async {
    final photoProperties = await dataSource.getPhotoProperties(zpid);
    return photoProperties
        .map((prop) => PhotosEntities(
              caption: prop.caption,
              mixedSources: MixedSourcesEntities(jpegImages: JpegImages(url: prop.mixedSources.jpegImages.url, width: prop.mixedSources.jpegImages.width), webpImages: WebpImages(
                  url: prop.mixedSources.webpImages.url,
                  width: prop.mixedSources.webpImages.width,
                ),),
            ))
        .toList();
  }
}