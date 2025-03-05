import 'package:clean_arch/module/data/repository/search_props_repo.dart';
import 'package:clean_arch/module/domain/entities/properties/search_prop_entity.dart';

class SearchPropsUsecases {
  final SearchPropsRepositoy repository;

  SearchPropsUsecases({required this.repository});

  Future<List<SearchPropertyEntities>> call(String location) async {
    return await repository.fetchSearchProperties(location);
  }
}