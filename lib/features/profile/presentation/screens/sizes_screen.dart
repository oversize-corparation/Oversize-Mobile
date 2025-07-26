import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SizesScreen extends StatefulWidget {
  const SizesScreen({super.key});

  @override
  State<SizesScreen> createState() => _SizesScreenState();
}

class _SizesScreenState extends State<SizesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, title: Text("sizes".tr())),
      body: Column(
        children: [
          _buildRadioTile(const Locale('uz'), 'US'),
          _buildRadioTile(const Locale('en'), 'EU'),
          _buildRadioTile(const Locale('ru'), 'UK'),
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
