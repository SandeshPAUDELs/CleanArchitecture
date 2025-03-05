import 'package:clean_arch/module/domain/entities/zpid/propertyV2/zpid_property_entities.dart';

abstract class ZpidPropertyV2Repository {
  Future<List<ZPIDPropertyEntities>> fetchZpidPropertyV2(String zpid);
}