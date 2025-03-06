class AgentByUsernameModels {
  final String currentUrl;
  final DisplayUserModels displayUser;

  AgentByUsernameModels({
    required this.currentUrl,
    required this.displayUser,
  });

  factory AgentByUsernameModels.fromJson(Map<String, dynamic> json) {
    return AgentByUsernameModels(
      currentUrl: json['currentUrl'],
      displayUser: DisplayUserModels.fromJson(json['displayUser']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentUrl': currentUrl,
      'displayUser': displayUser.toJson(),
    };
  }
}

class DisplayUserModels {
  final BusinessAddressModels businessAddress;
  final String businessName;
  final String email;
  final PhoneNumbersModels phoneNumbers;
  final String profilePhotoSrc;
  // final String zGuid;

  DisplayUserModels({
    required this.businessAddress,
    required this.businessName,
    required this.email,
    required this.phoneNumbers,
    required this.profilePhotoSrc,
    // required this.zGuid,
  });

  factory DisplayUserModels.fromJson(Map<String, dynamic> json) {
    return DisplayUserModels(
      businessAddress: BusinessAddressModels.fromJson(json['businessAddress']),
      businessName: json['businessName'],
      email: json['email'],
      phoneNumbers: PhoneNumbersModels.fromJson(json['phoneNumbers']),
      profilePhotoSrc: json['profilePhotoSrc'],
    //   zGuid: json['zGuid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'businessAddress': businessAddress.toJson(),
      'businessName': businessName,
      'email': email,
      'phoneNumbers': phoneNumbers.toJson(),
      'profilePhotoSrc': profilePhotoSrc,
      // 'zGuid': zGuid,
    };
  }
}

class BusinessAddressModels {
  final String address1;
  final String city;
  final String postalCode;
  final String state;

  BusinessAddressModels({
    required this.address1,
    required this.city,
    required this.postalCode,
    required this.state,
  });

  factory BusinessAddressModels.fromJson(Map<String, dynamic> json) {
    return BusinessAddressModels(
      address1: json['address1'],
      city: json['city'],
      postalCode: json['postalCode'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address1': address1,
      'city': city,
      'postalCode': postalCode,
      'state': state,
    };
  }
}

class PhoneNumbersModels {
  final String business;
  final String cell;

  PhoneNumbersModels({
    required this.business,
    required this.cell,
  });

  factory PhoneNumbersModels.fromJson(Map<String, dynamic> json) {
    return PhoneNumbersModels(
      business: json['business'],
      cell: json['cell'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'business': business,
      'cell': cell,
    };
  }
}