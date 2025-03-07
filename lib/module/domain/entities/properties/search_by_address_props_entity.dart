class SearchPropertyByAddressEntities {
  final String abbreviatedAddress;
  final AddressEntity address;
  final String description;
  final String desktopWebHdpImageLink;
  SearchPropertyByAddressEntities({
    required this.abbreviatedAddress,
    required this.address,
    required this.description,
    required this.desktopWebHdpImageLink,
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