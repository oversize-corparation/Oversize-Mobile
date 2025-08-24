import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/widgets/row_widget.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/card/presentation/widgets/most_popular_products.dart';
import 'package:oversize/features/home/presentation/widgets/categories_box.dart';
import 'package:oversize/features/home/presentation/widgets/flesh_sale_items.dart';
import 'package:oversize/features/home/presentation/widgets/home_banner.dart';
import 'package:oversize/features/home/presentation/widgets/new_products.dart';
import 'package:oversize/features/home/presentation/widgets/recomended_list.dart';
import 'package:oversize/features/home/presentation/widgets/top_products_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      backgroundColor: Colors.transparent,
      color: AppColor.deepPurple,
      onRefresh: () async {},
      child: ListView(
        clipBehavior: Clip.none,
        padding: EdgeInsets.all(20),
        children: [
          HomeBanner(),
          20.h,
          RowWidget(title: "category"),
          10.h,
          CategoriesBox(),
          27.h,
          Text(
            "tops".tr(),
            style: AppStyle.w700s18h34DarkBluePrimary.copyWith(fontSize: 21),
          ),
          // 10.h,
          TopProductsWidget(),
          25.h,
          RowWidget(title: "news".tr()),
          10.h,
          NewProducts(),
          24.h,
          FleshSaleItems(discount: 20),
          24.h,
          RowWidget(title: "popular"),
          10.h,
          MostPopularProducts(),
          28.h,
          Row(
            children: [
              Text(
                "foryou".tr(),
                style: AppStyle.w700s18h34DarkBluePrimary.copyWith(
                  fontSize: 21,
                ),
              ),
              5.w,
              Icon(
                CupertinoIcons.star_fill,
                size: 17,
                color: AppColor.deepPurple,
              ),
            ],
          ),
          10.h,
          RecomendedList(),
        ],
      ),
    );
  }
}
