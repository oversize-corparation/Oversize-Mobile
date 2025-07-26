import 'package:flutter/material.dart';
import 'package:oversize/core/services/local_storage.dart';
import 'package:oversize/features/home/presentation/screens/home_screen.dart';
import 'package:oversize/features/app/pin_code_app_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkPinStatus();
  }

  Future<void> _checkPinStatus() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate loading
    final savedPin = await LocalStorage.getSavedPin();

    if (savedPin != null && savedPin.isNotEmpty) {
      // PIN bor — uni sorash
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PinCodeAppScreen()),
      );
    } else {
      // PIN yo'q — to'g'ridan-to'g'ri home yoki login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()), // yoki LoginScreen
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
