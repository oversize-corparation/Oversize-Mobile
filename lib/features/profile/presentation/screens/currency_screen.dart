import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oversize/core/constants/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  String? selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("currency".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 6),
            _buildRadioTile('\$ USD'),
            const SizedBox(height: 6),
            _buildRadioTile('€ EURO'),
            const SizedBox(height: 6),
            _buildRadioTile('₽ RUB'),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioTile(String title) {
    bool isSelected = selectedCurrency == title;

    return ZoomTapAnimation(
      end: 0.97,
      onTap: () {
        setState(() {
          selectedCurrency = title;
        });
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffFFEBEB) : AppColor.profileLitTile,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: AppColor.white),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSelected ? Icons.check_circle : Icons.circle,
                color: isSelected ? AppColor.deepPurple : AppColor.circlePink,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
