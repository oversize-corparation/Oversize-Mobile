import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/app/app_export.dart';

class PopularItemWidget extends StatelessWidget {
  final String imageUrl;
  final String type;
  final String qty;
  const PopularItemWidget({
    super.key,
    required this.imageUrl,
    required this.type,
    required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(-3, 0),
            blurRadius: 6,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(3, 0),
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              height: 110,
              width: 100,
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          7.h,
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                qty.toString(),
                style: AppStyle.w700s18h34DarkBluePrimary.copyWith(
                  fontSize: 15,
                ),
              ),
              Icon(Icons.favorite, color: AppColor.deepPurple, size: 18),
              Spacer(),
              Text(type, style: AppStyle.w500s14h28Black500),
            ],
          ),
        ],
      ),
    );
  }
}
