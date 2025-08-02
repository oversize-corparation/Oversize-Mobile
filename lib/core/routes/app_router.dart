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
  static String otp = '/otp';
  static String settings = '/settings';
  static String language = '/language';
  static String currency = '/currency';
  static String splash = '/splash';
  static String pinSetup = '/pinSetup';
  static String pinApp = '/pinApp';
  static String editProfile = '/editProfile';
  static String shippingAdres = '/shippingAdres';

  static GoRouter router = GoRouter(
    // initialLocation: start,
    initialLocation: profile,
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
      GoRoute(
        path: AppRouter.otp,
        name: AppRouter.otp,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const OtpScreen(),
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
        path: AppRouter.pinSetup,
        name: AppRouter.pinSetup,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: PinSetupScreen(),
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
        path: AppRouter.splash,
        name: AppRouter.splash,
        builder: (context, state) {
          return SplashScreen();
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
              GoRoute(
                path: AppRouter.settings,
                name: AppRouter.settings,
                builder: (context, state) {
                  return SettingScreen();
                },
              ),
              GoRoute(
                path: AppRouter.language,
                name: AppRouter.language,
                builder: (context, state) {
                  return LanguageScreen();
                },
              ),
              GoRoute(
                path: AppRouter.currency,
                name: AppRouter.currency,
                builder: (context, state) {
                  return CurrencyScreen();
                },
              ),

              GoRoute(
                path: AppRouter.editProfile,
                name: AppRouter.editProfile,
                builder: (context, state) {
                  return EditProfile();
                },
              ),
              GoRoute(
                path: AppRouter.shippingAdres,
                name: AppRouter.shippingAdres,
                builder: (context, state) {
                  return ShippingAdres();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
