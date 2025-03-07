import 'package:clean_arch/common/style/common_style.dart';
import 'package:clean_arch/common/widgets/app_bar_widget.dart';
import 'package:clean_arch/common/widgets/describing_widget.dart';
import 'package:clean_arch/common/widgets/nav-drawer.dart';
import 'package:clean_arch/core/config/themes/custome_theme/text_field_theme.dart';
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
      appBar: CustomAppBarTheme.appBarforPages(context, 'Photo Properties'),
      drawer: NavDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(CommonStyle.screenPadding),
            child: TextFieldsTheme.createTextField(
                context, searchController, 'Enter ZPID', (value) {
              if (value.isNotEmpty) {
                context
                    .read<PhotoPropertiesBloc>()
                    .add(FetchPhotoPropertiesEvent(zpid: value));
              }
            }),
          ),
          Expanded(
            child: BlocBuilder<PhotoPropertiesBloc, PhotoPropertiesState>(
              builder: (context, state) {
                if (state is PhotoPropertiesInitial) {
                  return HintDescriptionWidget(
                      title: 'Search Photo Properties',
                      subtitle: 'Enter your ZPID to get the Photo Properties',
                      icon: Icons.search);
                } else if (state is PhotoPropertiesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PhotoPropertiesLoaded) {
                  final properties = state.photoProperties;
                  if (properties.isEmpty) {
                    return const Center(child: Text('No properties found'));
                  }
                  return Padding(
                    padding: const EdgeInsets.all(CommonStyle.screenPadding),
                    child: ListView.builder(
                      itemCount: properties.length,
                      itemBuilder: (context, index) {
                        final property = properties[index];
                        return ListTile(
                          title: Text(property.caption ?? 'No Caption'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(
                                    CommonStyle.smallPadding),
                                child: Text(
                                  'Jpeg Image',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              ...property.mixedSources!.jpegImages!
                                  .map((jpeg) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                            ),
                                            itemCount: property.mixedSources!
                                                .jpegImages!.length,
                                            itemBuilder: (context, index) {
                                              final jpeg = property
                                                  .mixedSources!
                                                  .jpegImages![index];
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        CommonStyle
                                                            .smallBorderRadius),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Image.network(
                                                        jpeg.url ?? ''),
                                                    Text(
                                                        'Width: ${jpeg.width}'),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      )),
                              Text(
                                'WebP Image',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              ...property.mixedSources!.webpImages!
                                  .map((webp) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                            ),
                                            itemCount: property.mixedSources!
                                                .webpImages!.length,
                                            itemBuilder: (context, index) {
                                              final webp = property
                                                  .mixedSources!
                                                  .webpImages![index];
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        CommonStyle
                                                            .smallBorderRadius),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Image.network(
                                                        webp.url ?? ''),
                                                    Text(
                                                        'Width: ${webp.width}'),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      )),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is PhotoPropertiesError) {
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
