import 'package:clean_arch/core/config/routes/routes.dart';
import 'package:clean_arch/core/config/routes/routes_name.dart';
import 'package:clean_arch/core/config/themes/colors.dart';
import 'package:clean_arch/core/config/themes/custome_theme/text_theme.dart';
import 'package:clean_arch/module/presentation/bLoc/agents/search_agents_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/photo_properties/photo_propertied_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/properties_by_address/search_properties_by_address_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/zpid_properties_v2/zpid_properties_v2_bloc.dart';
import 'package:clean_arch/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchPropertiesBloc>(
            create: (context) => sl<SearchPropertiesBloc>()),
        BlocProvider(create: (context) => sl<SearchPropertiesByAddressBloc>()),
        BlocProvider(create: (context) => sl<ZpidPropertiesV2Bloc>()),
        BlocProvider(create: (context) => sl<PhotoPropertiesBloc>()),
        BlocProvider(create: (context) => sl<SearchAgentsBloc>()),
      ],
      child: MaterialApp(
        title: 'Clean Architecture',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme,
          textTheme: TextThemes.createTextTheme(context),
        ),
        
        initialRoute: AppRoutesName.homeScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
