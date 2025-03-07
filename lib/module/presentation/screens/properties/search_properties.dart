import 'package:clean_arch/common/style/common_style.dart';
import 'package:clean_arch/common/widgets/app_bar_widget.dart';
import 'package:clean_arch/common/widgets/describing_widget.dart';
import 'package:clean_arch/common/widgets/nav-drawer.dart';
import 'package:clean_arch/core/config/themes/custome_theme/text_field_theme.dart';
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_event.dart';
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProperties extends StatelessWidget {
  const SearchProperties({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar:
          CustomAppBarTheme.appBarforPages(context, 'Properties by Location'),
      drawer: NavDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(CommonStyle.screenPadding),
            child: TextFieldsTheme.createTextField(
                context, searchController, 'Search', (value) {
              if (value.isNotEmpty) {
                context
                    .read<SearchPropertiesBloc>()
                    .add(FetchSearchProperties(location: value));
              }
            }),
          ),
          Expanded(
            child: BlocBuilder<SearchPropertiesBloc, SearchPropertiesState>(
              builder: (context, state) {
                if (state is SearchPropertiesInitial) {
                  return HintDescriptionWidget(
                      title: 'Search Propertied',
                      subtitle: 'Enter Your Location to Search Properties',
                      icon: Icons.search);
                } else if (state is SearchPropertiesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchPropertiesLoaded) {
                  final properties = state.searchProperties;
                  return ListView.builder(
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final property = properties[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(property.imgSrc ?? ''),
                        ),
                        title: Text(property.country),
                        subtitle:
                            Text('${property.city}, ${property.currency}'),
                        trailing: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(CommonStyle.smallBorderRadius),
                          ),
                          child: Text(property.homeStatus),
                        ),
                      );
                    },
                  );
                } else if (state is SearchPropertiesError) {
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
