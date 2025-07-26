import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricLoginPage extends StatefulWidget {
  const BiometricLoginPage({super.key});

  @override
  State<BiometricLoginPage> createState() => _BiometricLoginPageState();
}

class _BiometricLoginPageState extends State<BiometricLoginPage> {
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Ilovani ochish uchun barmoq izidan foydalaning',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      debugPrint('Biometric auth error: $e');
    }

    if (authenticated) {
      // Ilovaga kirish ruxsat beriladi
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Muvoffaqiyatli autentifikatsiya!')),
      );
      // Navigator.pushReplacement(...); // Keyingi sahifaga o‘ting
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Autentifikatsiya bekor qilindi.')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _authenticate(); // Ilova ochilganda avtomatik ishga tushishi uchun
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Biometrik Kirish")),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: _authenticate,
          icon: const Icon(Icons.fingerprint),
          label: const Text("Barmoq izidan foydalanish"),
        ),
      ),
    );
  }
}
