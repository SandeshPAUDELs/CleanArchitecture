class SearchAgentModels {
  final String businessName;
  final String encodedZuid;
  final String fullName;
  final int numTotalReviews;
  final String profilePhotoSrc;
  final String phoneNumber;

  SearchAgentModels({
    required this.businessName,
    required this.encodedZuid,
    required this.fullName,
    required this.numTotalReviews,
    required this.profilePhotoSrc,
    required this.phoneNumber,
  });
  
  factory SearchAgentModels.fromJson(Map<String, dynamic> json) {
    return SearchAgentModels(
      businessName: json['businessName'] ?? '',
      encodedZuid: json['encodedZuid'] ?? '',
      fullName: json['fullName'] ?? '',
      numTotalReviews: json['numTotalReviews'] ?? 0,
      profilePhotoSrc: json['profilePhotoSrc'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'encodedZuid': encodedZuid,
      'fullName': fullName,
      'numTotalReviews': numTotalReviews,
      'profilePhotoSrc': profilePhotoSrc,
      'phoneNumber': phoneNumber,
    };
  }

}