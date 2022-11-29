import 'package:demo_app/authentication/authentication.dart';
import 'package:demo_app/screens/add_consumer.dart';
import 'package:demo_app/services/firestore_service.dart';
import 'package:demo_app/services/navigation_service.dart';
import 'package:demo_app/view/addconsumer_viewmodel.dart';
import 'package:demo_app/view/home_viewmodel.dart';
import 'package:demo_app/view/login_viewmodel.dart';
import 'package:demo_app/view/profile_viewmodel.dart';
import 'package:demo_app/view/register_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => FireStoreService());
  getIt.registerLazySingleton(() => AuthenticationHelper());
  getIt.registerFactory(() => LoginViewModel());
  getIt.registerFactory(() => RegisterViewModel());
  getIt.registerFactory(() => ProfileViewModel());
  getIt.registerFactory(() => HomeViewModel());
  getIt.registerFactory(() => AddConsumerViewModel());
}
