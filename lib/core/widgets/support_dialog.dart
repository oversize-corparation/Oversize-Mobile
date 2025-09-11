import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oversize/core/constants/app_colors.dart';
import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/core/widgets/translator.dart';

class SupportDialog extends StatelessWidget {
  const SupportDialog({super.key});

  static show(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return SupportDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.white16r.copyWith(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 60,
              height: 4,
              decoration: AppDecorations.lightGray400R16NoBorder,
            ),
          ),
          16.h,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("support".tr(), style: AppStyle.w600s18h22DarkBluePrimary),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(CupertinoIcons.xmark, color: Colors.black, size: 20),
              ),
            ],
          ),
          16.h,
          Container(
            decoration: AppDecorations.lightGray400R16NoBorder.copyWith(
              color: AppColor.lightGray100,
            ),
            child: ListTile(
              onTap: () {
                // launch("");
              },
              title: Translator(
                uz: "Mutaxasis bilan chat",
                ru: "Чат с экспертом",
                en: "Мутахассис билан чат",
                style: AppStyle.w600s15h20DarkBluePrimary,
              ),
              subtitle: Translator(
                uz: "Biz hamma vaqt sizga yordam berishga tayyormiz",
                ru: "Мы всегда готовы вам помочь",
                en: "Биз ҳамма вақт сизга ёрдам беришга тайёрмиз",
                style: AppStyle.w400s13h18DarkBlue300,
              ),
            ),
          ),
          16.h,
          Container(
            decoration: AppDecorations.lightGray400R16NoBorder.copyWith(
              color: AppColor.lightGray100,
            ),
            child: ListTile(
              onTap: () {
                // launch("tel:+998990000000");
              },
              title: Text(
                "+99888 000 00 00",
                style: AppStyle.w600s15h20DarkBluePrimary,
              ),
              subtitle: Text(
                "support_number".tr(),
                style: AppStyle.w400s13h18DarkBlue300,
              ),
            ),
          ),
          16.h,
          Container(
            decoration: AppDecorations.lightGray400R16NoBorder.copyWith(
              color: AppColor.lightGray100,
            ),
            child: ListTile(
              onTap: () {
                // launch("tel:+998990000000");
              },
              title: Text(
                "+99888 000 00 00",
                style: AppStyle.w600s15h20DarkBluePrimary,
              ),
              subtitle: Text(
                "support_number".tr(),
                style: AppStyle.w400s13h18DarkBlue300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
