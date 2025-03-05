import 'package:clean_arch/module/presentation/bLoc/photo_properties/photo_propertied_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/photo_properties/photo_properties_event.dart';
import 'package:clean_arch/module/presentation/bLoc/photo_properties/photo_properties_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoProperty extends StatelessWidget {
  const PhotoProperty({super.key});

  @override
  Widget build(BuildContext context) {
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
                    .read<PhotoPropertiesBloc>()
                    .add(FetchPhotoPropertiesEvent(zpid: value));
              }
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<PhotoPropertiesBloc, PhotoPropertiesState>(
            builder: (context, state) {
              if (state is PhotoPropertiesInitial) {
                return const Center(child: Text('Enter an address to search'));
              } else if (state is PhotoPropertiesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PhotoPropertiesLoaded) {
                final properties = state.photoProperties;
                if (properties.isEmpty) {
                  return const Center(child: Text('No properties found'));
                }
                return ListView.builder(
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    final property = properties[index];
                    return ListTile(
                      title: Text(property.caption),
                        subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: properties
                          .map((prop) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(prop.mixedSources.jpegImages.url),
                              Text('JPEG Image Width: ${prop.mixedSources.jpegImages.width}'),
                              Image.network(prop.mixedSources.webpImages.url),
                              Text('WebP Image Width: ${prop.mixedSources.webpImages.width}'),
                              ],
                            ))
                          .toList(),
                        ),
                    );
                  },
                );
              } else if (state is PhotoPropertiesError) {
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