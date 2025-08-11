import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/card/presentation/widgets/card_item_card.dart';
import 'package:oversize/features/card/presentation/widgets/popular_item_widget.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColor.lightGray100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shipping Address",
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Text(
                        "26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city",
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CircleAvatar(
                        backgroundColor: AppColor.deepPurple,
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.h,
          CartItemCard(
            imageUrl:
                "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",
            title: "Lorem ipsum dolor sit amet",
            subtitle: "Pink, Size M",
            price: 17,
            quantity: 1,
            onDelete: () {},
            onIncrease: () {},
            onDecrease: () {},
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
                  qty: "1780💙",
                ),
              ],
            ),
          ),
          // EmptyWidget(
          //   image: SvgPicture.asset(
          //     AppImages.emptyCart,
          //     color: AppColor.deepPurple,
          //   ),
          // ),
        ],
      ),
    );
  }
}
