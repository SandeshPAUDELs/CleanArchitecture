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
      appBar: AppBar(
        title: const Text('Search Properties'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search by location',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context
                      .read<SearchPropertiesBloc>()
                      .add(FetchSearchProperties(location: value));
                }
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchPropertiesBloc, SearchPropertiesState>(
              builder: (context, state) {
                if (state is SearchPropertiesInitial) {
                  return const Center(
                      child: Text('Enter a location to search'));
                } else if (state is SearchPropertiesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchPropertiesLoaded) {
                  final properties = state.searchProperties;
                  return ListView.builder(
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final property = properties[index];
                      return ListTile(
                        title: Text(property.country),
                        subtitle: Text('${property.city}, ${property.country}'),
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
