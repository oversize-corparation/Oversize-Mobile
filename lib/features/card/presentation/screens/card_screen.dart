import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:oversize/features/card/presentation/widgets/cart_body.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("card".tr()), backgroundColor: Colors.white),
      body: CartBody(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: AppColor.fillColor,
        height: 70,
        child: Row(
          children: [
            Text(
              "${"total".tr()} \$0,00",
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            Spacer(),
            ZoomTapAnimation(
              onTap: () {},
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(child: Text("checkout".tr())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
