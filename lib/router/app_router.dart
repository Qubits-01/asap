import 'package:go_router/go_router.dart';

import '../features/home/presentation/home_screen.dart';
import '../features/splash_startup/presentation/splash_startup_screen.dart';
import '../features/user_profile/presentation/user_profile.dart';

class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: SplashStartupScreen.routeName,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: SplashStartupScreen.routeName,
        builder: (_, __) => const SplashStartupScreen(),
      ),
      GoRoute(
        path: HomeScreen.routeName,
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: UserProfile.routName,
        builder: (_, __) => const UserProfile(),
      ),
    ],
  );
}
