import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/config/widgets/button_widget.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/source/main_source.dart';
import 'package:oversize/core/widgets/translator.dart';

import 'package:oversize/features/app/app_export.dart';

class EmptyReviewScreen extends StatelessWidget {
  const EmptyReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sharh".tr())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sentiment_satisfied_alt,
              size: 100,
              color: const Color.fromARGB(255, 223, 177, 7),
            ),
            10.h,
            Translator(
              uz: "Hozircha sharhlar yo‘q. Birinchi bo‘lib fikr bildiring!",
              ru: "Пока нет отзывов. Будьте первым, кто оставит комментарий!",
              en: "No reviews yet. Be the first to comment!",
              textAlign: TextAlign.center,
              maxLen: 2,
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
