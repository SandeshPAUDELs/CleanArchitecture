import 'package:clean_arch/common/style/common_style.dart';
import 'package:clean_arch/common/widgets/app_bar_widget.dart';
import 'package:clean_arch/common/widgets/describing_widget.dart';
import 'package:clean_arch/common/widgets/nav-drawer.dart';
import 'package:clean_arch/core/config/themes/custome_theme/text_field_theme.dart';
import 'package:clean_arch/module/presentation/bLoc/zpid_properties_v2/zpid_properties_v2_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/zpid_properties_v2/zpid_properties_v2_event.dart';
import 'package:clean_arch/module/presentation/bLoc/zpid_properties_v2/zpid_properties_v2_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZPIDPropertyV2 extends StatelessWidget {
  const ZPIDPropertyV2({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBarTheme.appBarforPages(context, 'ZPID Properties'),
      drawer: NavDrawer(),
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(CommonStyle.screenPadding),
          child: TextFieldsTheme.createTextField(
              context, searchController, 'search', (value) {
            if (value.isNotEmpty) {
              context
                  .read<ZpidPropertiesV2Bloc>()
                    .add(FetchZpidPropertiesV2(zpid: value));
            }
          }),
        ),
        Expanded(
          child: BlocBuilder<ZpidPropertiesV2Bloc, ZpidPropertiesV2State>(
            builder: (context, state) {
              if (state is ZpidPropertiesV2Initial) {
                return HintDescriptionWidget(title: 'Search Property Details', subtitle: 'Enter your Zpid to get the Property Details', icon: Icons.search);
              } else if (state is ZpidPropertiesV2Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ZpidPropertiesV2Loaded) {
                final properties = state.zpidProperties;
                if (properties.isEmpty) {
                  return const Center(child: Text('No properties found'));
                }
                return ListView.builder(
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    final property = properties[index];
                    return ListTile(
                      title: Text(property.abbreviatedAddress),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('City: ${property.address.city}'),
                          Text('State: ${property.address.state}'),
                          Text('Street: ${property.address.streetAddress}'),
                          Text('Zipcode: ${property.address.zipcode}'),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is ZpidPropertiesV2Error) {
                return Center(child: Text(state.message));
              }
              return Container();
            },
          ),
        ),
      ],
    ));
  }
}
