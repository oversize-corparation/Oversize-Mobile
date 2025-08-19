import 'package:flutter/cupertino.dart';
import 'package:oversize/features/card/presentation/widgets/popular_item_widget.dart';

class MostPopularProducts extends StatelessWidget {
  const MostPopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          PopularItemWidget(
            imageUrl:
                "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",
            type: "New ",
            qty: "1780💙",
          ),
        ],
      ),
    );
  }
}
