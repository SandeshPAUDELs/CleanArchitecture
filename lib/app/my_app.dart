import 'package:clean_arch/core/config/routes/routes.dart';
import 'package:clean_arch/core/config/routes/routes_name.dart';
import 'package:clean_arch/module/data/sources/properties/search_properties_source.dart';
import 'package:clean_arch/module/domain/repositories/search_props_repo_impl.dart';
import 'package:clean_arch/module/domain/usecases/search_props_usecases.dart';
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchPropertiesDataSource dataSource =
        SearchPropertiesDataSourceImpl();
    final SearchPropsRepoImpl repository = SearchPropsRepoImpl(dataSource);
    final SearchPropsUsecases fetchsearchProperties =
        SearchPropsUsecases(repository: repository);

    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchPropertiesBloc>(
            create: (context) => SearchPropertiesBloc(
                searchPropsUsecases: fetchsearchProperties)),
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
