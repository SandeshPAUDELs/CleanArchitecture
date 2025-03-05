import 'package:clean_arch/module/domain/repositories/search_props_repo.dart';
import 'package:clean_arch/module/data/sources/properties/search_properties_source.dart';
import 'package:clean_arch/module/domain/entities/properties/search_prop_entity.dart';

class SearchPropsRepoImpl extends SearchPropsRepositoy{
  final SearchPropertiesDataSource dataSource;

  SearchPropsRepoImpl(this.dataSource);

  @override
  Future<List<SearchPropertyEntities>> fetchSearchProperties(String location) async {
    final searchProperties = await dataSource.fetchSearchProperties(location);
    return searchProperties.map((prop) => SearchPropertyEntities(
      bathrooms: prop.bathrooms,
      bedrooms: prop.bedrooms,
      city: prop.city,
      country: prop.country,
      currency: prop.currency,
      daysOnZillow: prop.daysOnZillow,
      homeStatus: prop.homeStatus,
    )).toList();
    
  }
}