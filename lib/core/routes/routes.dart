import 'package:go_router/go_router.dart';
import 'package:islamic_app/features/main_screen/presentation/view/main_screen.dart';
import '../../features/home/presentation/view/home_page.dart';
import '../../splash.dart';

abstract class AppRouter {
  static const kQuranScreen = '/quranScreen';
  static const kMainScreen = '/mainScreen';
  static const kSplashScreen = '/splashScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: '/quranScreen',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/mainScreen',
        builder: (context, state) => const MainScreen(),
      ),
    ],
  );
}
