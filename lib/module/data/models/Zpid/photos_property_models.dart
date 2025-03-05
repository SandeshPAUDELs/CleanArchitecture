class PhotosModels {
  final String caption;
  final MixedSourcesModels mixedSources;
  PhotosModels({
    required this.caption,
    required this.mixedSources,
  });
  factory PhotosModels.fromJson(Map<String, dynamic> json) {
    return PhotosModels(
      caption: json['caption'],
      mixedSources: MixedSourcesModels.fromJson(json['mixedSources']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'caption': caption,
      'mixedSources': mixedSources.toJson(),
    };
  }
}

class MixedSourcesModels {
  final JpegImagesModels jpegImages;
  final WebpImagesModels webpImages;
  MixedSourcesModels({
    required this.jpegImages,
    required this.webpImages,
  });
  factory MixedSourcesModels.fromJson(Map<String, dynamic> json) {
    return MixedSourcesModels(
      jpegImages: JpegImagesModels.fromJson(json['jpegImages']),
      webpImages: WebpImagesModels.fromJson(json['webpImages']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'jpegImages': jpegImages.toJson(),
      'webpImages': webpImages.toJson(),
    };
  }
}
class JpegImagesModels {
  final String url;
  final int width;
  JpegImagesModels({
    required this.url,
    required this.width,
  });
  factory JpegImagesModels.fromJson(Map<String, dynamic> json) {
    return JpegImagesModels(
      url: json['url'],
      width: json['width'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'width': width,
    };
  }
}
class WebpImagesModels {
  final String url;
  final int width;
  WebpImagesModels({
    required this.url,
    required this.width,
  });
  factory WebpImagesModels.fromJson(Map<String, dynamic> json) {
    return WebpImagesModels(
      url: json['url'],
      width: json['width'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'width': width,
    };
  }
}

