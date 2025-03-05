import 'package:clean_arch/module/presentation/bLoc/properties_by_address/search_properties_by_address_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/properties_by_address/search_properties_by_address_event.dart';
import 'package:clean_arch/module/presentation/bLoc/properties_by_address/search_properties_by_address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPropertiesByAddress extends StatelessWidget {
  const SearchPropertiesByAddress({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    final searchController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search by address',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context
                      .read<SearchPropertiesByAddressBloc>()
                      .add(FetchSearchPropertiesByAddress(address: value));
                }
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchPropertiesByAddressBloc, SearchPropertiesByAddressState>(
              builder: (context, state) {
                if (state is SearchPropertiesByAddressInitial) {
                  return const Center(
                      child: Text('Enter an address to search'));
                } else if (state is SearchPropertiesByAddressLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchPropertiesByAddressLoaded) {
                  final properties = state.searchProperties;
                  return ListView.builder(
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final property = properties[index];
                      return ListTile(
                        title: Text(property.abbreviatedAddress),
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
      )
    );
  }
}