import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:oversize/features/card/presentation/widgets/popular_item_widget.dart';
import 'package:oversize/features/favourite/presentation/screens/recently_viewed_screen.dart';
import 'package:oversize/features/favourite/presentation/widgets/wishlist_item_widget.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Row(
            children: [
              Text(
                "view".tr(),
                style: AppStyle.w700s18h34DarkBluePrimary.copyWith(
                  fontSize: 21,
                  letterSpacing: -0.21,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (contex) => RecentlyViewedScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios, color: AppColor.deepPurple),
              ),
            ],
          ),
          14.h,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              children: List.generate(
                6,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.amber,
                  ),
                ),
              ),
            ),
          ),
          14.h,
          WishlistItemWidget(
            imageUrl:
                "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",
            title: "Lorem ipsum dolor sit amet",
            price: 17.00,
            color: "Pink",
            size: "M",
            onDelete: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "popular".tr(),
                style: AppStyle.w700s18h34DarkBluePrimary.copyWith(
                  fontSize: 21,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'all'.tr(),
                      style: AppStyle.w700s18h34DarkBluePrimary.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Color(0xFF2B3A55),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          10.h,
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: [
                PopularItemWidget(
                  imageUrl:
                      "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",
                  type: "New",
                  qty: 1780,
                ),
              ],
            ),
          ),
          // EmptyWidget(
          //   image: SvgPicture.asset(
          //     AppImages.favoriteCart,
          //     color: AppColor.deepPurple,
          //   ),
          // ),
        ],
      ),
    );
  }
}
