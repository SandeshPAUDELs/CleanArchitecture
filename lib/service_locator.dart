import 'package:clean_arch/module/data/repository/search_props_repo.dart';
import 'package:clean_arch/module/data/sources/properties/search_properties_source.dart';
import 'package:clean_arch/module/domain/repositories/search_props_repo_impl.dart';
import 'package:clean_arch/module/domain/usecases/search_props_usecases.dart';
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_bloc.dart';
import 'package:get_it/get_it.dart';
// final GetIt sl = GetIt.instance;
// void initializeServiceLocator() {
//   // Bloc
//   sl.registerFactory(() => SearchPropertiesBloc(searchPropsUsecases: sl()));
//   // use case
//   sl.registerSingleton(() => SearchPropsUsecases(repository: sl()));
//   // Repository
//   sl.registerSingleton(() => SearchPropsRepoImpl(sl()));
//   // Data source
//   sl.registerSingleton(() => SearchPropertiesDataSourceImpl());
// }

final GetIt sl = GetIt.instance;
void initializeServiceLocator() {
  // Data source
  sl.registerLazySingleton<SearchPropertiesDataSource>(() => SearchPropertiesDataSourceImpl());
  // Repository
  sl.registerLazySingleton<SearchPropsRepositoy>(() => SearchPropsRepoImpl(sl()));
  // Use case
  sl.registerLazySingleton(() => SearchPropsUsecases(repository: sl()));

  // Bloc
  sl.registerFactory(() => SearchPropertiesBloc(searchPropsUsecases: sl()));
}