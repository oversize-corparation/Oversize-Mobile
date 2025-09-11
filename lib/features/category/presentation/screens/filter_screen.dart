import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/category/presentation/widgets/filter_body.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text("filter".tr(), style: AppStyle.w700s28Raleway),
        actions: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      body: FilterBody(),
      bottomNavigationBar: Container(
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
              Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: AppDecorations.border16.copyWith(
                      border: Border.all(color: AppColor.deepPink),
                    ),
                    child: Center(
                      child: Text(
                        "clear".tr(),
                        style: AppStyle.w300s22hnunitoSunsWhite.copyWith(
                          color: AppColor.deepPink,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              10.w,
              Expanded(
                flex: 7,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    height: 50,
                    decoration: AppDecorations.border16.copyWith(
                      color: AppColor.deepPink,
                    ),
                    child: Center(
                      child: Text(
                        "apply".tr(),
                        style: AppStyle.w300s22hnunitoSunsWhite,
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
