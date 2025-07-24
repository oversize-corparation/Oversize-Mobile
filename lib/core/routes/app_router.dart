import 'package:go_router/go_router.dart';
import 'package:oversize/features/card/presentation/screens/card_screen.dart';
import 'package:oversize/features/category/presentation/screens/category_screen.dart';
import 'package:oversize/features/favourite/presentation/screens/favourite_screen.dart';
import 'package:oversize/features/home/presentation/screens/home_screen.dart';
import 'package:oversize/features/main/main_screen.dart';
import 'package:oversize/features/profile/presentation/screens/profile_screen.dart';

class AppRouter {
  static String home = "/home";
  static String category = "/category";
  static String favourite = "/favourite";
  static String card = "/card";
  static String profile = "/profile";

  static GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationShell) =>
                MainScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouter.home,
                name: AppRouter.home,
                builder: (context, state) {
                  return HomeScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouter.category,
                name: AppRouter.category,
                builder: (context, state) {
                  return CategoryScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouter.favourite,
                name: AppRouter.favourite,
                builder: (context, state) {
                  return FavouriteScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouter.card,
                name: AppRouter.card,
                builder: (context, state) {
                  return CardScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouter.profile,
                name: AppRouter.profile,
                builder: (context, state) {
                  return ProfileScreen();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
