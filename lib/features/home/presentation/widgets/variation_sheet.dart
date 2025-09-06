import 'dart:ui';
import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/app/app_export.dart';

class VariationSheet extends StatefulWidget {
  final String? selectedColor;
  final String? selectedSize;
  final List<String>? images;
  final String? qty;
  const VariationSheet({
    super.key,
    this.selectedColor,
    this.selectedSize,
    this.images,
    this.qty,
  });

  static show(
    BuildContext context,
    String? selectedColor,
    String? selectedSize,
    List<String> images,
    String? qty,
  ) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return VariationSheet(
          selectedColor: selectedColor,
          selectedSize: selectedSize,
          images: images,
          qty: qty,
        );
      },
    );
  }

  @override
  State<VariationSheet> createState() => _VariationSheetState();
}

class _VariationSheetState extends State<VariationSheet> {
  String? _selectedColor;
  String? _selectedSize;
  String? _qty;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.selectedColor;
    _selectedSize = widget.selectedSize;
    _qty = widget.qty;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                widget.images![0],
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$17,00",
                                    style: AppStyle.w800s26RalewayBlack,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: AppDecorations.size,
                                        child: Text(
                                          _selectedColor ?? "",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: AppDecorations.size,
                                        child: Text(
                                          _selectedSize ?? "",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Color Options",
                          style: AppStyle.w800s20RalewayBlack,
                        ),
                        15.h,
                        Wrap(
                          children: [
                            ...["Red", "Blue", "Green", "Black"].map((color) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() => _selectedColor = color);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: _selectedColor == color
                                            ? Colors.green
                                            : Colors.amber,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(child: Text(color)),
                                    ),
                                    if (_selectedColor == color)
                                      Positioned(
                                        bottom: 10,
                                        left: 10,
                                        child: Icon(
                                          Icons.check_circle,
                                          size: 30,
                                          color: AppColor.deepPurple,
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),

                        15.h,
                        Text("Size", style: AppStyle.w800s20RalewayBlack),
                        Wrap(
                          children: [
                            ...["S", "M", "L", "XL", "XXL", "XXXL"].map((size) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() => _selectedSize = size);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  margin: EdgeInsets.all(8),
                                  decoration: _selectedSize == size
                                      ? AppDecorations.size.copyWith(
                                          border: BoxBorder.all(
                                            color: AppColor.deepPurple,
                                          ),
                                        )
                                      : AppDecorations.greySize,
                                  child: Text(
                                    size,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                        34.h,
                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quantity",
                              style: AppStyle.w800s20RalewayBlack,
                            ),
                            Spacer(),
                            ZoomTapAnimation(
                              child: Icon(
                                Icons.remove_circle_outline,
                                size: 55,
                                color: AppColor.deepPurple,
                              ),
                              onTap: () {},
                            ),
                            Container(
                              height: 40,
                              width: 65,
                              decoration: AppDecorations.size,
                              child: Center(
                                child: Text(
                                  "${_qty ?? 0} ",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            ZoomTapAnimation(
                              child: Icon(
                                Icons.add_circle_outline,
                                color: AppColor.deepPurple,
                                size: 55,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: SafeArea(
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColor.lightPink,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border, size: 24),
                            ),
                          ),
                          16.w,
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                decoration: AppDecorations.border16.copyWith(
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          16.w,
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                decoration: AppDecorations.border16.copyWith(
                                  color: AppColor.deepPink,
                                ),
                                child: Center(
                                  child: Text(
                                    "Buy now",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
