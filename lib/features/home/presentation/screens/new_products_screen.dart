import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/routes/export_route.dart';
import 'package:oversize/core/widgets/product_item_widget.dart';

class NewProductsScreen extends StatelessWidget {
  const NewProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("news".tr())),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 10,
          clipBehavior: Clip.none,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 8,
          ),
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
      ),
    );
  }
}
