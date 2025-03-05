import 'package:clean_arch/module/domain/entities/properties/search_by_address_props_entity.dart';
import 'package:clean_arch/module/domain/repositories/search_by_address_repo.dart';

class SearchPropsByAddressUsecases {
  final SearchPropertiesByAddressRepo _addressRepository;

  SearchPropsByAddressUsecases(this._addressRepository);

  Future<List<SearchPropertyByAddressEntities>> call(String address) async {
    return await _addressRepository.fetchSearchByAddress(address);
  }
}