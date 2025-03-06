import 'package:clean_arch/module/data/repository/agents_by_username_repo_impl.dart';
import 'package:clean_arch/module/data/repository/photo_property_impl.dart';
import 'package:clean_arch/module/data/repository/search_agent_repo_impl.dart';
import 'package:clean_arch/module/data/repository/search_props_by_address_impl.dart';
import 'package:clean_arch/module/data/repository/zpid_props_v2_impl.dart';
import 'package:clean_arch/module/data/sources/agents/agents_by_username_source.dart';
import 'package:clean_arch/module/data/sources/agents/search_agents_source.dart';
import 'package:clean_arch/module/data/sources/properties/search_properties_by_address_source.dart';
import 'package:clean_arch/module/data/sources/zpid/photo_property_source.dart';
import 'package:clean_arch/module/data/sources/zpid/zpid_props_v2_source.dart';
import 'package:clean_arch/module/domain/repositories/agent_by_username_repo.dart';
import 'package:clean_arch/module/domain/repositories/photo_property_repo.dart';
import 'package:clean_arch/module/domain/repositories/search_agent_repo.dart';
import 'package:clean_arch/module/domain/repositories/search_by_address_repo.dart';
import 'package:clean_arch/module/domain/repositories/search_props_repo.dart';
import 'package:clean_arch/module/data/sources/properties/search_properties_source.dart';
import 'package:clean_arch/module/data/repository/search_props_repo_impl.dart';
import 'package:clean_arch/module/domain/repositories/zpid_property_v2_repo.dart';
import 'package:clean_arch/module/domain/usecases/agent_by_usernameusecases.dart';
import 'package:clean_arch/module/domain/usecases/photo_property_usecases.dart';
import 'package:clean_arch/module/domain/usecases/search_agent_usecases.dart';
import 'package:clean_arch/module/domain/usecases/search_props_by_address_usecases.dart';
import 'package:clean_arch/module/domain/usecases/search_props_usecases.dart';
import 'package:clean_arch/module/domain/usecases/zpid_proprty_v2_usecases.dart';
import 'package:clean_arch/module/presentation/bLoc/agents/search_agents_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/agents_byUsername/agents_by_username_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/photo_properties/photo_propertied_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/properties/search_properties_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/properties_by_address/search_properties_by_address_bloc.dart';
import 'package:clean_arch/module/presentation/bLoc/zpid_properties_v2/zpid_properties_v2_bloc.dart';
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
  sl.registerLazySingleton<SearchPropertiesByAddressDataSource>(() => SearchPropertiesByAddressDataSourceImpl());
  sl.registerLazySingleton<ZpidPropsV2DataSource>(() => ZpidPropsV2SourceImpl());
  sl.registerLazySingleton<PhotoPropertySource>(() => PhotoPropertySourceImpl());
  sl.registerLazySingleton<SearchAgentsDataSource>(() => SearchAgentsDataSourceImpl());
  sl.registerLazySingleton<AgentsByUsernameSource>(() => AgentsByUsernameSourceImpl());
  // Repository
  sl.registerLazySingleton<SearchPropsRepositoy>(() => SearchPropsRepoImpl(sl()));
  sl.registerLazySingleton<SearchPropertiesByAddressRepo>(() => SearchPropsByAddressRepoImpl(sl()));
  sl.registerLazySingleton<ZpidPropertyV2Repository>(() => ZpidPropsV2Impl(sl()));
  sl.registerLazySingleton<PhotoPropertyRepo>(() => PhotoPropertyRepoImpl(sl()));
  sl.registerLazySingleton<SearchAgentRepo>(() => SearchAgentRepoImpl(sl()));
  sl.registerLazySingleton<AgentByUsernameRepo>(() => AgentsByUsernameRepoImpl(sl()));

  // Use case
  sl.registerLazySingleton(() => SearchPropsUsecases(repository: sl()));
  sl.registerLazySingleton(() => SearchPropsByAddressUsecases(sl()));
  sl.registerLazySingleton(() => ZpidProprtyV2Usecases(repository: sl()));
  sl.registerLazySingleton(() => PhotoPropertyUsecases(repository: sl()));
  sl.registerLazySingleton(() => SearchAgentUsecases(repository: sl()));
  sl.registerLazySingleton(() => AgentByUsernameusecases(repository: sl()));


  // Bloc
  sl.registerFactory(() => SearchPropertiesBloc(searchPropsUsecases: sl()));
  sl.registerFactory(() => SearchPropertiesByAddressBloc(searchPropsByAddressUsecases: sl()));
  sl.registerFactory(() => ZpidPropertiesV2Bloc(zpidPropertiesV2Usecases: sl()));
  sl.registerFactory(() => PhotoPropertiesBloc(photoPropertyUsecases: sl()));
  sl.registerFactory(() => SearchAgentsBloc(searchAgentUsecases: sl()));
  sl.registerFactory(() => AgentsByUsernameBloc(agentByUsernameusecases: sl()));
  }