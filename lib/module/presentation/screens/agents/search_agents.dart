import 'package:clean_arch/common/style/common_style.dart';
import 'package:clean_arch/common/widgets/app_bar_widget.dart';
import 'package:clean_arch/common/widgets/describing_widget.dart';
import 'package:clean_arch/core/config/themes/custome_theme/text_field_theme.dart';
import 'package:clean_arch/module/presentation/bLoc/agents/search_agents_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/agents/search_agents_state.dart';
import 'package:clean_arch/module/presentation/bLoc/agents/serach_agents_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAgents extends StatelessWidget {
  const SearchAgents({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBarTheme.appBarforPages(context, 'Search Agents'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(CommonStyle.screenPadding),
            child: TextFieldsTheme.createTextField(
                context, searchController, 'Enter location', (value) {
              if (value.isNotEmpty) {
                context
                    .read<SearchAgentsBloc>()
                    .add(FetchSearchAgentsEvents(location: value));
              }
            }),
          ),
          Expanded(
            child: BlocBuilder<SearchAgentsBloc, SearchAgentsState>(
              builder: (context, state) {
                if (state is SearchAgentsInitial) {
                  return HintDescriptionWidget(
                      title: 'Search Agents Properties',
                      subtitle:
                          'Enter your location to get the Agents Properties',
                      icon: Icons.search);
                } else if (state is SearchAgentsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchAgentsLoaded) {
                  final properties = state.searchAgents;
                  if (properties.isEmpty) {
                    return const Center(child: Text('No properties found'));
                  }
                  return ListView.builder(
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final property = properties[index];
                      return ListTile(
                        title: Text(property.fullName),
                        subtitle: Text(property.businessName),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(property.profilePhotoSrc),
                        ),
                      );
                    },
                  );
                } else if (state is SearchAgentsError) {
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