import 'package:go_router/go_router.dart';

import '../core/features/auth/presentation/email_otp_verification_screen.dart';
import '../core/features/auth/presentation/forgot_password_screen.dart';
import '../core/features/auth/presentation/login_screen.dart';
import '../core/features/auth/presentation/phone_number_otp_verification_screen.dart';
import '../core/features/auth/presentation/sign_up_screen/sign_up_screen.dart';
import '../features/announcements/presentation/edit_announcement_screen.dart';
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

      // Auth screens.
      GoRoute(
        path: LoginScreen.routeName,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: SignUpScreen.routeName,
        builder: (_, __) => const SignUpScreen(),
      ),
      GoRoute(
        path: ForgotPasswordScreen.routeName,
        builder: (_, __) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: EmailOtpVerificationScreen.routeName,
        builder: (_, __) => const EmailOtpVerificationScreen(),
      ),
      GoRoute(
        path: PhoneNumberOtpVerificationScreen.routeName,
        builder: (_, __) => const PhoneNumberOtpVerificationScreen(),
      ),

      GoRoute(
        path: HomeScreen.routeName,
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: UserProfile.routName,
        builder: (_, __) => const UserProfile(),
      ),
      GoRoute(
        path: EditAnnouncementScreen.routeName,
        builder: (_, __) => const EditAnnouncementScreen(),
      ),
    ],
  );
}
