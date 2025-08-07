import 'package:flutter/cupertino.dart';
import 'package:oversize/features/app/app_export.dart';

class WishlistItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final String color;
  final String size;
  final VoidCallback? onDelete;
  final VoidCallback? onAddToCart;

  const WishlistItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.color,
    required this.size,
    this.onDelete,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: 120,
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
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 14)),
              SizedBox(height: 6),
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Chip(label: Text(color), backgroundColor: AppColor.lightPink),
                  SizedBox(width: 6),
                  Chip(label: Text(size), backgroundColor: AppColor.lightPink),
                  Spacer(),
                  GestureDetector(
                    onTap: onAddToCart,
                    child: Icon(
                      // ? Icons.shopping_cart_checkout_rounded
                      // :
                      Icons.shopping_cart_outlined,
                      color: AppColor.deepPurple,
                      size: 28,
                    ),
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
