import 'package:clean_arch/module/data/sources/properties/search_properties_by_address_source.dart';
import 'package:clean_arch/module/domain/entities/properties/search_by_address_props_entity.dart';
import 'package:clean_arch/module/domain/repositories/search_by_address_repo.dart';

class SearchPropsByAddressRepoImpl extends SearchPropertiesByAddressRepo {
  final SearchPropertiesByAddressDataSource dataSource;
  SearchPropsByAddressRepoImpl(this.dataSource);

  @override
  Future<List<SearchPropertyByAddressEntities>> fetchSearchByAddress(String address) async {
    final searchProperties = await dataSource.fetchSearchByAddress(address);
    return searchProperties.map((prop) => SearchPropertyByAddressEntities(
      abbreviatedAddress: prop.abbreviatedAddress,
      description: prop.description,
      desktopWebHdpImageLink: prop.desktopWebHdpImageLink,
      address: AddressEntity(
        city: prop.address.city,
        state: prop.address.state,
        streetAddress: prop.address.streetAddress,
        zipcode: prop.address.zipcode,
      ),
    )).toList();
  }
}