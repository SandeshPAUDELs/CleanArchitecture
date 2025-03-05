class SearchProprtiedByAddressProperyModels {
  final String abbreviatedAddress;
  final int bathrooms;
  final int bedrooms;
  final String city;
  final int cityId;
  SearchProprtiedByAddressProperyModels({
    required this.abbreviatedAddress,
    required this.bathrooms,
    required this.bedrooms,
    required this.city,
    required this.cityId,
  });
  factory SearchProprtiedByAddressProperyModels.fromJson(Map<String, dynamic> json) {
    return SearchProprtiedByAddressProperyModels(
      abbreviatedAddress: json['abbreviatedAddress'],
      bathrooms: json['bathrooms'],
      bedrooms: json['bedrooms'],
      city: json['city'],
      cityId: json['cityId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'abbreviatedAddress': abbreviatedAddress,
      'bathrooms': bathrooms,
      'bedrooms': bedrooms,
      'city': city,
      'cityId': cityId,
    };
  }
}