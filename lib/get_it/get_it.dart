
import 'package:get_it/get_it.dart';
import 'package:wallet/data/repositories/category_repository.dart';
import 'package:wallet/services/open_api_service/open_api_service.dart';
import 'package:wallet/services/secure_api_service/secure_api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => OpenApiService());
  getIt.registerLazySingleton(() => SecureApiService());
  getIt.registerLazySingleton(() => CategoryRepository());
}
