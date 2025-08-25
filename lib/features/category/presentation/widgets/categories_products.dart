import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oversize/core/constants/app_images.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/core/widgets/product_item_widget.dart';

class CategoriesProducts extends StatelessWidget {
  const CategoriesProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("products".tr(), style: AppStyle.w700s18Raleway),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppImages.filter),
              ),
            ],
          ),
          14.h,
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            clipBehavior: Clip.none,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return ProductItemWidget(
                ontap: () {},
                image:
                    "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",

                name: "Lorem ipsum dolor sit amet consectetur",
                price: 16,
                discount: "20",
              );
            },
          ),
        ],
      ),
    );
  }
}
