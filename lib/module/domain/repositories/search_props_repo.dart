import 'package:clean_arch/module/domain/entities/properties/search_prop_entity.dart';

abstract class SearchPropsRepositoy {
  Future<List<SearchPropertyEntities>> fetchSearchProperties(String location);
}