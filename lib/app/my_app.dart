import 'package:clean_arch/core/config/routes/routes.dart';
import 'package:clean_arch/core/config/routes/routes_name.dart';
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/properties_by_address/search_properties_by_address_bloc.dart';
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
      ],
      child: MaterialApp(
        title: 'Clean Architecture',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutesName.homeScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
