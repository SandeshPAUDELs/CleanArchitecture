class SearchPropertyModels {
  final double bathrooms;
  final double bedrooms;
  final String city;
  final String country;
  final String currency;
  final int daysOnZillow;
  final String homeStatus;

  SearchPropertyModels({
    required this.bathrooms,
    required this.bedrooms,
    required this.city,
    required this.country,
    required this.currency,
    required this.daysOnZillow,
    required this.homeStatus,
  });

  factory SearchPropertyModels.fromJson(Map<String, dynamic> json) {
    return SearchPropertyModels(
      bathrooms: json['bathrooms']?.toDouble() ?? 0.0,
      bedrooms: json['bedrooms']?.toDouble() ?? 0.0,
      city: json['city'] ?? '',
      country: json['country'] ?? '',
      currency: json['currency'] ?? '',
      daysOnZillow: json['daysOnZillow'] ?? 0,
      homeStatus: json['homeStatus'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bathrooms': bathrooms,
      'bedrooms': bedrooms,
      'city': city,
      'country': country,
      'currency': currency,
      'daysOnZillow': daysOnZillow,
      'homeStatus': homeStatus,
    };
  }
}
