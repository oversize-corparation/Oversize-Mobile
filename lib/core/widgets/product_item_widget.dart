import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/app/app_export.dart';

class ProductItemWidget extends StatelessWidget {
  final String img;
  final String name;
  final String price;

  const ProductItemWidget({
    super.key,
    required this.img,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(4),
            height: 175,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(img, fit: BoxFit.cover),
            ),
          ),
          7.h,
          Text(
            name,
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Text(price, style: AppStyle.w700s18h34DarkBluePrimary),
        ],
      ),
    );
  }
}
