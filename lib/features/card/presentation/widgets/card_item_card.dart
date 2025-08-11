import 'package:flutter/cupertino.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/utils/utils.dart';
import 'package:oversize/features/app/app_export.dart';

class CartItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int price;
  final int quantity;
  final VoidCallback onDelete;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    required this.onDelete,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: 125,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 6,
              left: 6,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    CupertinoIcons.delete,
                    color: Colors.red,
                    size: 18,
                  ),
                  onPressed: onDelete,
                ),
              ),
            ),
          ],
        ),
        8.w,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              4.h,
              Text(
                subtitle,
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              8.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${Utils.cashFormat(price.toString())},00",
                    style: AppStyle.w700s15Raleway.copyWith(fontSize: 18),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.remove_circle_outline,
                          size: 30,
                          color: AppColor.deepPurple,
                        ),
                        onPressed: onDecrease,
                      ),
                      Ink(
                        height: 30,
                        width: 37,
                        decoration: BoxDecoration(
                          color: AppColor.lightPink,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            quantity.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: AppColor.deepPurple,
                          size: 30,
                        ),
                        onPressed: onIncrease,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
