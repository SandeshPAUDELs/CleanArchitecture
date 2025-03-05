class ZpidPropertyModels {
  final String abbreviatedAddress;
  final AddressModel address;

  ZpidPropertyModels({
    required this.abbreviatedAddress,
    required this.address,
  });

  factory ZpidPropertyModels.fromJson(Map<String, dynamic> json) {
    return ZpidPropertyModels(
      abbreviatedAddress: json['abbreviatedAddress'],
      address: AddressModel.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'abbreviatedAddress': abbreviatedAddress,
      'address': address.toJson(),
    };
  }
}

class AddressModel {
  final String city;
  final String state;
  final String streetAddress;
  final String zipcode;

  AddressModel({
    required this.city,
    required this.state,
    required this.streetAddress,
    required this.zipcode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      city: json['city'],
      state: json['state'],
      streetAddress: json['streetAddress'],
      zipcode: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'state': state,
      'streetAddress': streetAddress,
      'zipcode': zipcode,
    };
  }
}