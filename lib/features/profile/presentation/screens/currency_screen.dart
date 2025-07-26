import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("currency".tr()),
      ),
      body: Column(
        children: [
          _buildRadioTile(const Locale('uz'), '\$ USD'),
          _buildRadioTile(const Locale('en'), '€ EURO'),
          _buildRadioTile(const Locale('ru'), '₽ RUB'),
        ],
      ),
    );
  }

  Widget _buildRadioTile(Locale locale, String title) {
    return RadioListTile(
      title: Text(title),
      value: locale,
      groupValue: true,
      onChanged: (value) {},
    );
  }
}
