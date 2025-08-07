import 'package:flutter/material.dart';
import 'package:oversize/features/favourite/presentation/widgets/wishlist_item_widget.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          WishlistItemWidget(
            imageUrl:
                "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79",
            title: "Lorem ipsum dolor sit amet",
            price: 17.00,
            color: "Pink",
            size: "M",
            onDelete: () {},
          ),
        ],
      ),
    );
  }
}
