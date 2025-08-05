import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Translator extends StatelessWidget {
  final String uz;
  final String ru;
  final String en;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLen;

  const Translator({
    super.key,
    required this.uz,
    required this.ru,
    required this.en,
    this.style,
    this.textAlign,
    this.maxLen,
  });

  @override
  Widget build(BuildContext context) {
    final currentLan = context.locale;
    final langCode = currentLan.languageCode;

    String lang;

    switch (langCode) {
      case 'uz':
        lang = uz;
        break;
      case 'ru':
        lang = ru;
        break;
      default:
        lang = en;
        break;
    }

    return Text(
      lang,
      style: style,
      textAlign: textAlign,
      maxLines: maxLen,
      overflow: TextOverflow.ellipsis,
    );
  }
}
