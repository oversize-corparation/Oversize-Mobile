import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  Locale? _selectedLocale;

  void _changeLanguage(Locale locale) async {
    try {
      await context.setLocale(locale);
      setState(() {
        _selectedLocale = locale;
      });
    } catch (e) {
      print('Til o‘zgartirish xatosi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = _selectedLocale ?? context.locale;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("language".tr()),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _buildRadioTile(const Locale('uz'), 'O\'zbekcha', currentLocale),
          _buildRadioTile(const Locale('en'), 'English', currentLocale),
          _buildRadioTile(const Locale('ru'), 'Русский', currentLocale),
        ],
      ),
    );
  }

  Widget _buildRadioTile(Locale locale, String title, Locale currentLocale) {
    return RadioListTile<Locale>(
      title: Text(title),
      value: locale,
      groupValue: currentLocale,
      onChanged: (Locale? value) {
        if (value != null) {
          _changeLanguage(value);
        }
      },
    );
  }
}
