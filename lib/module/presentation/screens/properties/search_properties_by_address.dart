import 'package:clean_arch/common/style/common_style.dart';
import 'package:clean_arch/common/widgets/app_bar_widget.dart';
import 'package:clean_arch/common/widgets/containers_widget.dart';
import 'package:clean_arch/common/widgets/describing_widget.dart';
import 'package:clean_arch/common/widgets/nav-drawer.dart';
import 'package:clean_arch/core/config/themes/custome_theme/text_field_theme.dart';
import 'package:clean_arch/module/presentation/bLoc/properties_by_address/search_properties_by_address_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/properties_by_address/search_properties_by_address_event.dart';
import 'package:clean_arch/module/presentation/bLoc/properties_by_address/search_properties_by_address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPropertiesByAddress extends StatelessWidget {
  const SearchPropertiesByAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar:
          CustomAppBarTheme.appBarforPages(context, 'Properties with Address'),
      drawer: NavDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(CommonStyle.screenPadding),
            child: TextFieldsTheme.createTextField(
                context, searchController, 'search', (value) {
              if (value.isNotEmpty) {
                context
                    .read<SearchPropertiesByAddressBloc>()
                    .add(FetchSearchPropertiesByAddress(address: value));
              }
            }),
          ),
          Expanded(
            child: BlocBuilder<SearchPropertiesByAddressBloc,
                SearchPropertiesByAddressState>(
              builder: (context, state) {
                if (state is SearchPropertiesByAddressInitial) {
                  return HintDescriptionWidget(
                      title: 'Search Property Details',
                      subtitle:
                          'Enter your Address to get the Property Details',
                      icon: Icons.search);
                } else if (state is SearchPropertiesByAddressLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchPropertiesByAddressLoaded) {
                  final properties = state.searchProperties;
                  return ListView.builder(
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final property = properties[index];
                      return Padding(
                        padding:
                            const EdgeInsets.all(CommonStyle.screenPadding),
                        child: ContainersforPages
                            .containerforSearchPropertiesByAddress(
                                context,
                                property.desktopWebHdpImageLink,
                                property.abbreviatedAddress,
                                property.address.city,
                                property.address.state,
                                property.address.streetAddress,
                                property.address.zipcode,
                                property.description),
                      );
                    },
                  );
                } else if (state is SearchPropertiesByAddressError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
