import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/widgets/translator.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/home/presentation/widgets/flash_sale_body.dart';
import 'package:oversize/features/home/presentation/widgets/flesh_time.dart';

class FlashSaleScreen extends StatelessWidget {
  const FlashSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "sale".tr(),
              style: AppStyle.w700s15Raleway.copyWith(fontSize: 28),
            ),
            // Text("",
            Translator(
              uz: "Chegirmani tanlang",
              ru: "Выберите свою скидку",
              en: "Choose Your Discount",
              style: AppStyle.w500s14h28Black500,
            ),
          ],
        ),
        actions: [
          Icon(Icons.timer_outlined, color: Colors.white),
          4.w,
          FleshTime(time: "00", color: false),
          2.w,
          FleshTime(time: "36", color: false),
          2.w,
          FleshTime(time: "58", color: false),
        ],
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(AppImages.bubbleOtp),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              AppImages.bubbleOtp2,
              color: AppColor.deepPink,
            ),
          ),
          // Positioned(child: ),
          SafeArea(child: FlashSaleBody()),
        ],
      ),
    );
  }
}
