import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oversize/core/constants/app_colors.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/core/routes/app_router.dart';
import 'package:oversize/core/services/local_storage.dart';

class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key});

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  final List<String> _input = [];

  void _addDigit(String digit) {
    if (_input.length < 4) {
      setState(() {
        _input.add(digit);
      });
    }
  }

  void _removeDigit() {
    if (_input.isNotEmpty) {
      setState(() {
        _input.removeLast();
      });
    }
  }

  Future<void> _verifyPin() async {
    final enteredPin = _input.join();
    final savedPin = HiveLocalStorageService.getValue<String>('user_pin');

    if (savedPin == null) {
      // PIN birinchi marta o‘rnatilmoqda
      await HiveLocalStorageService.setValue('user_pin', enteredPin);
      if (context.mounted) context.goNamed(AppRouter.home);
    } else {
      // PIN tekshirilmoqda
      if (enteredPin == savedPin) {
        if (context.mounted) context.goNamed(AppRouter.home);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("PIN noto‘g‘ri!")));
        setState(() {
          _input.clear();
        });
      }
    }
  }

  Widget _buildPinCircle(int index) {
    bool filled = index < _input.length;
    return Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? AppColor.deepPurple : AppColor.fillColor,
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return InkWell(
      borderRadius: BorderRadius.circular(35),
      onTap: () {
        _addDigit(number);
        if (_input.length == 4) {
          _verifyPin();
        }
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.bubble3,
        ),
        alignment: Alignment.center,
        child: Text(
          number,
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return GestureDetector(
      onTap: _removeDigit,
      child: const Icon(Icons.backspace_outlined, size: 30, color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            const Text(
              "PIN-kod",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "PIN-kodni kiriting",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, _buildPinCircle),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (var row in [
                  ['1', '2', '3'],
                  ['4', '5', '6'],
                  ['7', '8', '9'],
                  ['', '0', '←'],
                ])
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: row.map((item) {
                        if (item == '') return 35.w;
                        if (item == '←') return _buildBackspaceButton();
                        return _buildNumberButton(item);
                      }).toList(),
                    ),
                  ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
