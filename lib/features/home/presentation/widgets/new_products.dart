import 'package:oversize/core/widgets/product_item_widget.dart';
import 'package:oversize/features/auth/presentation/auth.dart';

class NewProducts extends StatelessWidget {
  const NewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        separatorBuilder: (context, index) => 10.w,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
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
    );
  }
}
