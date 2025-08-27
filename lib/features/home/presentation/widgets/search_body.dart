import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/home/presentation/widgets/discover_items.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "historySearch".tr(),
                style: AppStyle.w500s14h28Black500.copyWith(fontSize: 18),
              ),
              Icon(CupertinoIcons.delete, color: AppColor.error),
            ],
          ),
          20.h,
          Wrap(
            spacing: 6,
            children: [
              Chip(label: Text("socks")),
              Chip(label: Text("Red Dress")),
              Chip(label: Text("Sunglasses")),
              Chip(label: Text("Mustard Pants")),
              Chip(label: Text("80-s Skirt")),
            ],
          ),
          31.h,
          Text(
            "recommendations".tr(),
            style: AppStyle.w500s14h28Black500.copyWith(fontSize: 18),
          ),
          20.h,
          Wrap(
            spacing: 6,
            children: [
              Chip(label: Text("Skirt")),
              Chip(label: Text("Accessories")),
              Chip(label: Text("Black T-Shirt")),
              Chip(label: Text("Jeans")),
              Chip(label: Text("8White Shoes")),
            ],
          ),
          32.h,
          Text("discover".tr(), style: AppStyle.w700s21Raleway),
          5.h,
          DiscoverItems(),
        ],
      ),
    );
  }
}
