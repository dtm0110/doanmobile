import 'package:get_it/get_it.dart';
import 'package:job_search/data/local/secure_storage.dart';
import 'package:job_search/data/remote/account_api.dart';
import 'package:job_search/data/remote/common_api.dart';
import 'package:job_search/data/remote/interceptor/private_interceptor.dart';
import 'package:job_search/data/remote/job_api.dart';
import 'package:job_search/data/remote/province_api.dart';
import 'package:job_search/data/repository/auth_repository.dart';
import 'package:job_search/data/repository/career_repository.dart';
import 'package:job_search/data/repository/province_repository.dart';
import 'package:job_search/features/authentication/profile/selectmajor/import_major_vm.dart';
import 'package:job_search/features/filter/filter_vm.dart';
import 'package:job_search/features/job/applied/job_applied_vm.dart';
import 'package:job_search/features/main/main_vm.dart';
import 'package:job_search/features/splash/splash_vm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/network.dart';
import 'config.dart';
import 'data/local/prefs.dart';
import 'data/remote/interceptor/interceptor.dart';
import 'features/authentication/login/login_vm.dart';
import 'features/authentication/profile/editor/profile_editor_vm.dart';
import 'features/authentication/profile/profile_vm.dart';
import 'features/authentication/register/register_vm.dart';
import 'features/home/home_vm.dart';
import 'features/job/detail/job_vm.dart';
import 'features/job/favorite/job_favorite_vm.dart';
import 'features/job/filter/job_filter_vm.dart';

GetIt locator = GetIt.instance;
const deviceInstanceName = "deviceId";

void setupLocator(SharedPreferences prefs, String deviceId) {
  registerLocal(prefs, deviceId);
  registerRemote();
  registerRepository();
  registerUseCase();
  registerViewModel();
}

void registerLocal(SharedPreferences prefs, String deviceId) {
  locator.registerLazySingleton(() => prefs);
  locator.registerLazySingleton(() => Prefs(locator.get()));
  locator.registerLazySingleton<SecureStorage>(() => SecureStorageImpl());
  locator.registerLazySingleton(
    () => deviceId,
    instanceName: deviceInstanceName,
  );
}

void registerRemote() {
  locator.registerLazySingleton(() => Interceptor(
      locator.get(), locator.get(instanceName: deviceInstanceName)));

  locator.registerLazySingleton(() => PrivateInterceptor(
      locator.get(), locator.get(instanceName: deviceInstanceName)));

  locator.registerLazySingleton(
    () => AccountAPI(
      NetworkManager(environment.baseUrl, [locator.get<Interceptor>()]),
    ),
  );

  locator.registerLazySingleton(() => ProvinceApi(
      NetworkManager(environment.baseUrl, [locator.get<Interceptor>()])));

  locator.registerLazySingleton(() => JobApi(
      NetworkManager(environment.baseUrl, [locator.get<Interceptor>()])));

  locator.registerLazySingleton(
    () => CommonAPI(
      NetworkManager(environment.baseUrl, [locator.get<Interceptor>()]),
    ),
  );
}

void registerRepository() {
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      locator.get(),
      locator.get(),
    ),
  );

  locator.registerLazySingleton<ProvinceRepository>(
      () => ProvinceRepositoryImpl(locator.get()));

  locator.registerLazySingleton<CareerRepository>(() => CareerRepositoryImpl(
        locator.get(),
        locator.get(),
      ));
}

void registerUseCase() {}

void registerViewModel() {
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => HomeViewModel(locator.get()));
  locator.registerFactory(() => LoginViewModel(locator.get()));
  locator.registerFactory(() => RegisterViewModel(locator.get()));
  locator.registerFactory(() => JobViewModel(locator.get()));
  locator.registerFactory(() => JobFavoriteViewModel(locator.get()));
  locator.registerFactory(() => JobAppliedViewModel(locator.get()));
  locator.registerFactory(() => JobFilterViewModel());
  locator.registerFactory(() => MainViewModel());
  locator.registerFactory(() => ProfileViewModel(locator.get(), locator.get()));
  locator.registerFactory(() => ProfileEditorViewModel());
  locator.registerFactory(() => FilterVM(locator.get()));
  locator.registerFactory(() => ImportNetworkVM());
}
