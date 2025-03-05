import 'package:clean_arch/module/data/sources/zpid/zpid_props_v2_source.dart';
import 'package:clean_arch/module/domain/entities/zpid/propertyV2/zpid_property_entities.dart';
import 'package:clean_arch/module/domain/repositories/zpid_property_v2_repo.dart';

class ZpidPropsV2Impl extends ZpidPropertyV2Repository {
  final ZpidPropsV2DataSource dataSource;
  ZpidPropsV2Impl(this.dataSource);

  @override
Future<List<ZPIDPropertyEntities>> fetchZpidPropertyV2(String zpid) async {
  final zpidProperties = await dataSource.fetchZpidPropsV2(zpid);
  return zpidProperties
      .map((prop) => ZPIDPropertyEntities(
            abbreviatedAddress: prop.abbreviatedAddress,
            address: AddressEntity(
              city: prop.address.city,
              state: prop.address.state,
              streetAddress: prop.address.streetAddress,
              zipcode: prop.address.zipcode,
            ),
          ))
      .toList();
}
}
