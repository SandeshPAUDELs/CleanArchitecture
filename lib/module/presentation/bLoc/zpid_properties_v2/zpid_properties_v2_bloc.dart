import 'package:clean_arch/module/domain/usecases/zpid_proprty_v2_usecases.dart';
import 'package:clean_arch/module/presentation/bLoc/zpid_properties_v2/zpid_properties_v2_event.dart';
import 'package:clean_arch/module/presentation/bLoc/zpid_properties_v2/zpid_properties_v2_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZpidPropertiesV2Bloc extends Bloc<FetchZpidPropertiesV2, ZpidPropertiesV2State> {
  final ZpidProprtyV2Usecases zpidPropertiesV2Usecases;
  ZpidPropertiesV2Bloc({required this.zpidPropertiesV2Usecases}) : super(ZpidPropertiesV2Initial()) {
    on<FetchZpidPropertiesV2>((event, emit) async {
      emit(ZpidPropertiesV2Loading());
      try {
        final zpidProperties = await zpidPropertiesV2Usecases(event.zpid);
        emit(ZpidPropertiesV2Loaded(zpidProperties: zpidProperties));
      } catch (e) {
        emit(ZpidPropertiesV2Error(message: e.toString()));
      }
    });
  }

}
