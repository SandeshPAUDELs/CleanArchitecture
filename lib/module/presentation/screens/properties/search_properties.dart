import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_event.dart';
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProperties extends StatelessWidget {
  const SearchProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<SearchPropertiesBloc, SearchPropertiesState>(
          builder: (context, state) {
            if (state is SearchPropertiesInitial) {
              context.read<SearchPropertiesBloc>().add(FetchSearchProperties(location: 'houston'));
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
    );
  }
}