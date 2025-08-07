import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
        ),
      ),
      body: FavouriteBody(),
    );
  }
}
