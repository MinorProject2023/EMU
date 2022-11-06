import 'package:demo_app/provider/getit.dart';
import 'package:demo_app/route_generator.dart';
import 'package:demo_app/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(
    MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
