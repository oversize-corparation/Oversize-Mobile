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

    // 1️⃣ Onboarding flag tekshirish
    final isOnboarded = HiveLocalStorageService.getValue<bool>('isOnboarded') ?? false;
    if (!isOnboarded) {
      context.pushReplacement(AppRouter.onboard);
      return;
    }

    // 2️⃣ Auth tekshirish (token yoki foydalanuvchi ma'lumotlari Hive'da bormi)
    final accessToken = HiveLocalStorageService.getValue<String>('access_token');
    if (accessToken == null || accessToken.isEmpty) {
      context.pushReplacement(AppRouter.start); // login yoki start screen
      return;
    }

    // 3️⃣ PIN tekshirish
    final savedPin = HiveLocalStorageService.getValue<String>('user_pin');
    if (savedPin != null && savedPin.isNotEmpty) {
      context.pushReplacement(AppRouter.pinSetup);
    } else {
      context.pushReplacement(AppRouter.home); // to'g'ridan-to'g'ri home
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
