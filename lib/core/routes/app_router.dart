import 'package:oversize/core/routes/export_route.dart';

class AppRouter {
  static String home = "/home";
  static String category = "/category";
  static String favourite = "/favourite";
  static String card = "/card";
  static String profile = "/profile";
  static String start = '/start';
  static String login = '/login';
  static String createAccount = '/createAccount';
  static GoRouter router = GoRouter(
    initialLocation: start,
    routes: [
      GoRoute(
        path: AppRouter.start,
        name: AppRouter.start,
        builder: (context, state) {
          return StartScreen();
        },
      ),
      GoRoute(
        path: AppRouter.login,
        name: AppRouter.login,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginScreen(),
            transitionDuration: const Duration(milliseconds: 300), // optional
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  final offsetAnimation =
                      Tween<Offset>(
                        begin: const Offset(1.0, 0.0), // from right
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ),
                      );

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
          );
        },
      ),

      GoRoute(
        path: AppRouter.createAccount,
        name: AppRouter.createAccount,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const CreateAccountScreen(),
            transitionDuration: const Duration(milliseconds: 300), // optional
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  final offsetAnimation =
                      Tween<Offset>(
                        begin: const Offset(1.0, 0.0), // from right
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ),
                      );

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
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
