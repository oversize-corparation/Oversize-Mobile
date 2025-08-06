import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oversize/config/widgets/button_widget.dart';
import 'package:oversize/core/constants/app_images.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/core/routes/export_route.dart';
import 'package:oversize/core/utils/utils.dart';
import 'package:oversize/core/widgets/translator.dart';

class CardFormSheet extends StatefulWidget {
  final bool isEditMode;
  final String? initialCardHolder;
  final String? initialCardNumber;
  final String? initialValidDate;
  final String? initialCvv;
  final Function(String?, String?, String?, String?, String) onSave;
  final VoidCallback? onDelete;

  CardFormSheet({
    required this.isEditMode,
    this.initialCardHolder,
    this.initialCardNumber,
    this.initialValidDate,
    this.initialCvv,
    required this.onSave,
    this.onDelete,
  });

  @override
  State<CardFormSheet> createState() => CardFormSheetState();
}

class CardFormSheetState extends State<CardFormSheet> {
  late TextEditingController holderController;
  late TextEditingController numberController;
  late TextEditingController validController;
  late TextEditingController cvvController;
  String cardType = 'Unknown';
  Widget cardIcon = Icon(Icons.credit_card, size: 40);

  @override
  void initState() {
    super.initState();
    holderController = TextEditingController(text: widget.initialCardHolder);
    numberController = TextEditingController(text: widget.initialCardNumber);
    validController = TextEditingController(text: widget.initialValidDate);
    cvvController = TextEditingController(text: widget.initialCvv);

    if (widget.initialCardNumber != null) {
      cardType = Utils.identifyCardType(widget.initialCardNumber!);
      _updateCardIcon();
    }
  }

  @override
  void dispose() {
    holderController.dispose();
    numberController.dispose();
    validController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  void _updateCardIcon() {
    setState(() {
      switch (cardType) {
        case 'UzCard':
          cardIcon = Image.asset(
            AppImages.uzcard,
            height: 40,
            width: 40,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.credit_card, size: 40),
          );
          break;
        case 'HUMO':
          cardIcon = Image.asset(
            AppImages.humo,
            height: 40,
            width: 40,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.credit_card, size: 40),
          );
          break;
        case 'Visa':
          cardIcon = SvgPicture.asset(
            AppImages.visa,
            height: 40,
            width: 40,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.credit_card, size: 40),
          );
          break;
        case 'Mastercard':
          cardIcon = SvgPicture.asset(
            AppImages.mastercard,
            height: 40,
            width: 40,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.credit_card, size: 40),
          );
          break;
        default:
          cardIcon = Icon(Icons.credit_card, size: 40);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.isEditMode ? "editcard".tr() : "addcard".tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              if (widget.isEditMode)
                IconButton(
                  icon: Icon(CupertinoIcons.delete, color: Colors.red),
                  onPressed: widget.onDelete,
                ),
            ],
          ),
          16.h,
          Row(
            children: [
              cardIcon,
              8.w,
              Expanded(
                child: TextField(
                  controller: numberController,
                  decoration: InputDecoration(labelText: "cardNumber".tr()),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(19),
                    Utils.cardNumberFormatter,
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    setState(() {
                      cardType = Utils.identifyCardType(v);
                      _updateCardIcon();
                    });
                  },
                ),
              ),
            ],
          ),
          16.h,
          if (cardType == 'Visa' || cardType == 'Mastercard') ...[
            TextField(
              controller: holderController,
              decoration: InputDecoration(labelText: "holder".tr()),
              onChanged: (v) => holderController.text = v,
            ),
            16.h,
          ],
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: validController,
                  decoration: InputDecoration(labelText: "date".tr()),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(5),
                    Utils.cardDateFormatter,
                  ],
                  onChanged: (v) => validController.text = v,
                ),
              ),
              8.w,
              if (cardType == 'Visa' || cardType == 'Mastercard')
                Expanded(
                  child: TextField(
                    controller: cvvController,
                    decoration: InputDecoration(labelText: "CVV"),
                    inputFormatters: [LengthLimitingTextInputFormatter(3)],
                    keyboardType: TextInputType.number,
                    onChanged: (v) => cvvController.text = v,
                  ),
                ),
            ],
          ),
          16.h,
          ButtonWidget(
            onPressed: () {
              if (numberController.text.length != 19) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Translator(
                      uz: "Hisob raqamingizni to'lq kiriting",
                      ru: "Введите номер своего счета полностью",
                      en: "Please enter your account number completely",
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              if (validController.text.length != 5) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Translator(
                      uz: "Iltimos tog'ri formatda kiriting (MM/YY)",
                      ru: "Пожалуйста, введите в правильном формате (MM/YY)",
                      en: "Please enter correctly (MM/YY)",
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              widget.onSave(
                cardType == 'Visa' || cardType == 'Mastercard'
                    ? holderController.text
                    : null,
                numberController.text,
                validController.text,
                cardType == 'Visa' || cardType == 'Mastercard'
                    ? cvvController.text
                    : null,
                cardType,
              );
            },
            text: widget.isEditMode ? "save".tr() : "add".tr(),
          ),
        ],
      ),
    );
  }
}
