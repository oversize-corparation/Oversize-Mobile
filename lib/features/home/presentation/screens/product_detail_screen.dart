import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/home/presentation/widgets/product_details_body.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
        final double screenHeight = MediaQuery.of(context).size.height;
        final double indicatorTop = screenHeight * 0.35 - (_scrollOffset * 0.5);
        _showTitle = indicatorTop <= 56;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: _showTitle ? Colors.white : Colors.transparent,
        elevation: 0,
        title: AnimatedOpacity(
          opacity: _showTitle ? 1.0 : 0.0,
          duration: Duration(milliseconds: 200),
          child: Text("Product Name", style: AppStyle.w800s20RalewayBlack),
        ),
      ),
      body: SizedBox.expand(
        child: ProductDetailsBody(
          scrollController: _scrollController,
          scrollOffset: _scrollOffset,
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                decoration: AppDecorations.greySize,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.heart, size: 24),
                ),
              ),
              10.w,
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
                        "addCart".tr(),
                        style: AppStyle.w300s16hnunitoSunsWhite,
                      ),
                    ),
                  ),
                ),
              ),
              10.w,
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
                        "buy".tr(),
                        style: AppStyle.w300s16hnunitoSunsWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
