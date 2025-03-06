class AgentByUsernameEntities {
  final String currentUrl;
  final DisplayUserEntities displayUser;

  AgentByUsernameEntities({
    required this.currentUrl,
    required this.displayUser,
  });
}

class DisplayUserEntities {
  final BusinessAddressEntities businessAddress;
  final String businessName;
  final String email;
  final PhoneNumbersEntities phoneNumbers;
  final String profilePhotoSrc;
  // final String zGuid;

  DisplayUserEntities({
    required this.businessAddress,
    required this.businessName,
    required this.email,
    required this.phoneNumbers,
    required this.profilePhotoSrc,
    // required this.zGuid,
  });  
}

class BusinessAddressEntities {
  final String address1;
  final String city;
  final String postalCode;
  final String state;

  BusinessAddressEntities({
    required this.address1,
    required this.city,
    required this.postalCode,
    required this.state,
  });
}

class PhoneNumbersEntities {
  final String business;
  final String cell;

  PhoneNumbersEntities({
    required this.business,
    required this.cell,
  });
}