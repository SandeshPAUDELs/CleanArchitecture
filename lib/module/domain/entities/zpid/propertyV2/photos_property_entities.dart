class PhotosEntities {
  final String caption;
  final MixedSourcesEntities mixedSources;
  PhotosEntities({
    required this.caption,
    required this.mixedSources,
  });
}
class MixedSourcesEntities {
  final JpegImages jpegImages; 
  final WebpImages webpImages;
  MixedSourcesEntities({
    required this.jpegImages,
    required this.webpImages,
  });
}
class JpegImages {
  final String url;
  final int width;
  JpegImages({
    required this.url,
    required this.width,
  });
}
class WebpImages {
  final String url;
  final int width;
  WebpImages({
    required this.url,
    required this.width,
  });
}