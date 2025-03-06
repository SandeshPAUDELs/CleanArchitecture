class PhotosModels {
  final String? caption;
  final MixedSourcesModels? mixedSources;
  PhotosModels({
    this.caption,
    this.mixedSources,
  });

  factory PhotosModels.fromJson(Map<String, dynamic> json) {
    return PhotosModels(
      caption: json['caption']  ?? '',
      mixedSources: MixedSourcesModels.fromJson(json['mixedSources'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'caption': caption,
      'mixedSources': mixedSources?.toJson(),
    };
  }
}

class MixedSourcesModels {
  final List<JpegImagesModels>? jpeg;
  final List<WebpImagesModels>? webp;
  MixedSourcesModels({
    this.jpeg,
    this.webp,
  });

  factory MixedSourcesModels.fromJson(Map<String, dynamic> json) {
    return MixedSourcesModels(
      jpeg: (json['jpeg'] as List).map((item) => JpegImagesModels.fromJson(item)).toList(),
      webp: (json['webp'] as List).map((item) => WebpImagesModels.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jpeg': jpeg?.map((item) => item.toJson()).toList(),
      'webp': webp?.map((item) => item.toJson()).toList(),
    };
  }
}

class JpegImagesModels {
  final String? url;
  final int? width;
  JpegImagesModels({
    this.url,
    this.width,
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
  final String? url;
  final int? width;
  WebpImagesModels({
    this.url,
    this.width,
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