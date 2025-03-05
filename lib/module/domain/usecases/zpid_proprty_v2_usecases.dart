import 'package:clean_arch/module/domain/entities/zpid/propertyV2/zpid_property_entities.dart';
import 'package:clean_arch/module/domain/repositories/zpid_property_v2_repo.dart';

class ZpidProprtyV2Usecases {
  final ZpidPropertyV2Repository repository;
  ZpidProprtyV2Usecases({required this.repository});
  Future<List<ZPIDPropertyEntities>> call(String zpid) async {
    return await repository.fetchZpidPropertyV2(zpid);
  }
}