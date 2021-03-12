import 'package:get_it/get_it.dart';
import '../screens/filter/filter_viewmodel.dart';

import '../services/listings/listings_service.dart';
import '../services/listings/listings_service_rest.dart';
import '../services/rest_service.dart';
import '../screens/listings/listings_viewmodel.dart';
import '../screens/home/home_viewmodel.dart';
import '../screens/employer/employer_viewmodel.dart';

GetIt dependency = GetIt.instance;

void init() {
  dependency.registerLazySingleton(() => RestService());
  dependency
      .registerLazySingleton<ListingsService>(() => ListingsServiceRest());

  // Viewmodels
  dependency.registerLazySingleton(() => HomeViewModel());
  dependency.registerLazySingleton(() => ListingsViewModel());
  dependency.registerLazySingleton(() => EmployerViewModel());
  dependency.registerLazySingleton(() => FilterViewModel());
}
