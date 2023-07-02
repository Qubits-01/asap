import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../home/presentation/home_screen.dart';

class SplashStartupScreen extends StatefulWidget {
  const SplashStartupScreen({super.key});

  static const routeName = '/';

  @override
  State<SplashStartupScreen> createState() => _SplashStartupScreenState();
}

class _SplashStartupScreenState extends State<SplashStartupScreen> {
  @override
  void initState() {
    super.initState();

    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      GoRouter.of(context).go(HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Text(
          'Ate Ken\'s\nFood Delivery App',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
