class ZPIDPropertyEntities {
  final String abbreviatedAddress;
  final AddressEntity address;

  ZPIDPropertyEntities({
    required this.abbreviatedAddress,
    required this.address,
  });
}

class AddressEntity {
  final String city;
  final String state;
  final String streetAddress;
  final String zipcode;

  AddressEntity({
    required this.city,
    required this.state,
    required this.streetAddress,
    required this.zipcode,
  });
}