import 'package:demo_app/services/navigation_service.dart';
import 'package:demo_app/view/login_viewmodel.dart';
import 'package:demo_app/view/register_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => LoginViewModel());
  getIt.registerFactory(() => RegisterViewModel());
}
