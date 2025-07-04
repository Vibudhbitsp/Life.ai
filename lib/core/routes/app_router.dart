import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../shared/widgets/error_page.dart';

class AppRouter {
  static const String splash = '/';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(
      error: state.error?.toString(),
      onRetry: () => context.go(splash),
    ),
  );
} 