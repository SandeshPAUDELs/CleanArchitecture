class PhotosEntities {
  final String? caption;
  final MixedSourcesEntities? mixedSources;
  PhotosEntities({
    this.caption,
    this.mixedSources,
  });
}

class MixedSourcesEntities {
  final List<JpegImages>? jpegImages;
  final List<WebpImages>? webpImages;
  MixedSourcesEntities({
    this.jpegImages,
    this.webpImages,
  });
}

class JpegImages {
  final String? url;
  final int? width;
  JpegImages({
    this.url,
    this.width,
  });
}

class WebpImages {
  final String? url;
  final int? width;
  WebpImages({
    this.url,
    this.width,
  });
}