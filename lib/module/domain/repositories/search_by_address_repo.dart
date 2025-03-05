import 'package:clean_arch/module/domain/entities/properties/search_by_address_props_entity.dart';

abstract class SearchPropertiesByAddressRepo {
  Future<List<SearchPropertyByAddressEntities>> fetchSearchByAddress(String address);
}