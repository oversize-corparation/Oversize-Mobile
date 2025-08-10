import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oversize/core/constants/app_colors.dart';
import 'package:oversize/core/widgets/translator.dart';
import 'package:oversize/features/favourite/presentation/widgets/favourite_body.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Translator(
          uz: "Istaklar ro‘yxati",
          ru: "Список желаний",
          en: "Wishlist",
          style: GoogleFonts.raleway(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColor.cancel,
          ),
        ),
      ),
      body: FavouriteBody(),
    );
  }
}
