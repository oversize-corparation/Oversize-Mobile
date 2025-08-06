import 'package:flutter/services.dart';

class Utils {
  static bool isDioSuccess(int? statusCode) {
    if (statusCode == null) return false;
    return (statusCode > 199 && statusCode < 300);
  }

  static final CardDateInputFormatter cardDateFormatter =
      CardDateInputFormatter();

  static final CardNumberInputFormatter cardNumberFormatter =
      CardNumberInputFormatter();

  static String identifyCardType(String cardNumber) {
    final cleanCardNumber = cardNumber.replaceAll(RegExp(r'\D'), '');

    if (cleanCardNumber.length < 4) {
      return 'Unknown';
    }

    final prefix2 = cleanCardNumber.substring(0, 1);
    final prefix4 = cleanCardNumber.length >= 4
        ? cleanCardNumber.substring(0, 4)
        : '';

    if (prefix2 == '4') {
      return 'Visa';
    } else if (prefix4 == '8600') {
      return 'UzCard';
    } else if (prefix4 == '9860') {
      return 'HUMO';
    } else if (['51', '52', '53', '54', '55'].contains(prefix2)) {
      return 'Mastercard';
    } else {
      return 'Unknown';
    }
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll(' ', '');

    StringBuffer newText = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        newText.write(' ');
      }
      newText.write(text[i]);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CardDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll('/', '');

    if (text.length >= 3) {
      text = text.substring(0, 2) + '/' + text.substring(2);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
