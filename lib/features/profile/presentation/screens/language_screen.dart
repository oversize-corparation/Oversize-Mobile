import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oversize/features/app/app_export.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 6,
          children: [
            _buildRadioTile(const Locale('uz'), 'O\'zbekcha', currentLocale),
            _buildRadioTile(const Locale('en'), 'English', currentLocale),
            _buildRadioTile(const Locale('ru'), 'Русский', currentLocale),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioTile(Locale locale, String title, Locale currentLocale) {
    return ZoomTapAnimation(
      onTap: () {
        _changeLanguage(locale);
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColor.profileLitTile,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(
              currentLocale == locale ? Icons.check_circle : Icons.circle,
              color: currentLocale == locale
                  ? AppColor.deepPurple
                  : AppColor.circlePink,
              size: 30,
            ),
            // IconButton(

            //   icon:
            // ),
          ],
        ),
      ),
    );
  }
}
