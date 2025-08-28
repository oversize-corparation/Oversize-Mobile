import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/utils/utils.dart';
import 'package:oversize/features/app/app_export.dart';

class ProductItemWidget extends StatefulWidget {
  final Function() ontap;
  final String image;
  final String? discount;
  final String name;
  final int? price;

  const ProductItemWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.ontap,
    this.discount,
  });

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: widget.ontap,
      child: SizedBox(
        width: 190,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 200,
                    width: double.infinity,
                    decoration: AppDecorations.contaynerBlur,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.network(widget.image, fit: BoxFit.cover),
                    ),
                  ),
                  if ((widget.discount ?? "").isNotEmpty)
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          gradient: AppColor.saleGradient,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          "-${widget.discount}%",
                          style: AppStyle.w700s15Raleway.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Text(widget.name, style: AppStyle.w400s14hnunitoSunsBlack),
                    Row(
                      children: [
                        if ((widget.discount ?? "").isNotEmpty)
                          Text(
                            "\$${Utils.cashFormat((widget.discount).toString())},00 ",
                            style: AppStyle.w700s15Raleway.copyWith(
                              fontSize: 18,
                            ),
                            maxLines: 2,
                          ),
                        Text(
                          "\$${Utils.cashFormat(widget.price.toString())},00 ",
                          style: AppStyle.w700s15Raleway.copyWith(
                            decoration: (widget.discount ?? "").isNotEmpty
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: (widget.discount ?? "").isNotEmpty
                                ? AppColor.sale
                                : AppColor.cancel,
                            decorationColor: AppColor.sale,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
