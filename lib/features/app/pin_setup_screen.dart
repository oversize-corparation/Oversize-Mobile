import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oversize/core/constants/app_colors.dart';
import 'package:oversize/core/constants/app_images.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/core/routes/app_router.dart';
import 'package:oversize/core/services/local_storage.dart';
import 'package:vibration/vibration.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key});

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _input = [];
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _shakeAnimation =
        Tween<double>(
            begin: 0,
            end: 24,
          ).chain(CurveTween(curve: Curves.elasticIn)).animate(_shakeController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _shakeController
                  .reset(); // shake tugagach offsetni tiklaydi (0 ga)
            }
          });
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

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
      await HiveLocalStorageService.setValue('user_pin', enteredPin);
      if (context.mounted) context.goNamed(AppRouter.home);
    } else {
      if (enteredPin == savedPin) {
        if (context.mounted) context.goNamed(AppRouter.home);
      } else {
        _triggerErrorFeedback();
      }
    }
  }

  void _vibrateOnError() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 200); // xatolikda kuchliroq vibratsiya
    }
  }

  Future<void> _triggerErrorFeedback() async {
    setState(() {
      _isError = true;
    });
    _vibrateOnError();
    // Shake animation
    _shakeController.forward(from: 0);

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      _isError = false;
      _input.clear();
    });
  }

  Widget _buildPinCircle(int index) {
    bool filled = index < _input.length;
    Color color;
    if (_isError) {
      color = Colors.red;
    } else {
      color = filled ? AppColor.deepPurple : AppColor.circleBlur;
    }

    return Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

  Widget _buildNumberButton(String number) {
    return ZoomTapAnimation(
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
    return ZoomTapAnimation(
      onTap: _removeDigit,
      child: const Icon(Icons.backspace_outlined, size: 30, color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          SvgPicture.asset(AppImages.bubbleLogin, color: AppColor.bubble1),
          SvgPicture.asset(AppImages.bubbleLogin2, color: AppColor.deepPurple),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 4),
              const Text(
                "PIN-kod",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "PIN-kodni kiriting",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              24.h,
              Center(
                child: AnimatedBuilder(
                  animation: _shakeController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_shakeAnimation.value, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(4, _buildPinCircle),
                      ),
                    );
                  },
                ),
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
        ],
      ),
    );
  }
}
