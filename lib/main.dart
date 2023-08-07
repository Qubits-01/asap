import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bloc_observer.dart';
import 'router/app_router.dart';
import 'service_locator/service_locator.dart' as service_locator;
import 'themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the app bloc observer.
  // ignore: unused_local_variable
  const BlocObserver appBlocObserver = AppBlocObserver();

  // Initialize the services/dependencies.
  await service_locator.init();

  runApp(const AteKensFoodDeliveryApp());
}

class AteKensFoodDeliveryApp extends StatelessWidget {
  const AteKensFoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkMode,
      routerConfig: AppRouter.router,
    );
  }
}
