import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oversize/core/extension/space_extension.dart';

import 'package:oversize/core/routes/app_router.dart';
import 'package:oversize/core/routes/export_route.dart';
import 'package:oversize/features/profile/presentation/screens/payment_screen.dart';
import 'package:oversize/features/profile/presentation/widgets/profile_list_tile.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "personal".tr(),
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ),
        30.h,
        ProfileListTile(
          ontap: () {
            context.push(AppRouter.editProfile);
          },
          title: "profile",
        ),
        Divider(thickness: 0.5),
        ProfileListTile(
          ontap: () {
            context.push(AppRouter.shippingAdres);
          },
          title: "address",
        ),
        Divider(thickness: 0.5),
        ProfileListTile(
          ontap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => PaymentScreen()));
          },
          title: "payment",
        ),
        Divider(thickness: 0.5),
        30.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "shop".tr(),
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ),
        30.h,
        ProfileListTile(title: "country"),
        Divider(thickness: 0.5),
        ProfileListTile(
          ontap: () {
            context.push(AppRouter.currency);
          },
          title: "currency",
        ),
        Divider(thickness: 0.5),
        ProfileListTile(ontap: () {}, title: "terms"),
        Divider(thickness: 0.5),
        30.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "account".tr(),
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ),
        30.h,
        ProfileListTile(
          ontap: () {
            context.push(AppRouter.language);
          },
          title: "language",
          label: language(),
        ),
        40.h,
      ],
    );
  }

  String language() {
    final lan = context.locale.languageCode;
    if (lan == "uz") {
      return "O'z";
    } else if (lan == "en") {
      return "En";
    } else if (lan == "ru") {
      return "Ру";
    } else {
      return "O'z";
    }
  }
}
