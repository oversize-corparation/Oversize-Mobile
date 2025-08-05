import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:oversize/config/widgets/button_widget.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/source/main_source.dart';
import 'package:oversize/core/widgets/translator.dart';

import 'package:oversize/features/app/app_export.dart';

class EmptyOrderScreen extends StatelessWidget {
  const EmptyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("order".tr())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.shopping_cart, size: 100),
            10.h,
            Translator(
              uz: "Buyurtmalar tarixi bo'sh",
              ru: "История заказов пуста",
              en: "Order history is empty",
              style: AppStyle.w800s17h22Dark,
            ),

            20.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ButtonWidget(
                onPressed: () {
                  MainSources.currentPage.value = 0;
                  context.go(AppRouter.home);
                },
                text: "see".tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
