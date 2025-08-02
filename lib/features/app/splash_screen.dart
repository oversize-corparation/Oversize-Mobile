

import 'package:oversize/features/app/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    await HiveLocalStorageService.init(); // Hive init qilinadi

    await Future.delayed(const Duration(seconds: 2)); // fake loading

    final savedPin = HiveLocalStorageService.getValue<String>('user_pin');

    if (savedPin != null && savedPin.isNotEmpty) {
      // Agar PIN mavjud bo‘lsa — Pin kiritish screen
      context.pushReplacement(AppRouter.pinSetup);
    } else {
      // Agar PIN mavjud bo‘lmasa — to‘g‘ridan-to‘g‘ri home screen
      context.pushReplacement(AppRouter.start);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
