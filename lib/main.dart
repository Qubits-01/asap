import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'themes/app_theme.dart';

void main() {
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
