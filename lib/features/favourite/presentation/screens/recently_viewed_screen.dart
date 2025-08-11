import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/widgets/product_item_widget.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/favourite/presentation/widgets/calendar_widget.dart';
import 'package:oversize/features/favourite/presentation/widgets/date_tab_widget.dart';

class RecentlyViewedScreen extends StatefulWidget {
  const RecentlyViewedScreen({super.key});

  @override
  State<RecentlyViewedScreen> createState() => _RecentlyViewedScreenState();
}

class _RecentlyViewedScreenState extends State<RecentlyViewedScreen> {
  final ValueNotifier<int> type = ValueNotifier(1);
  ValueNotifier<DateTime?> selectedCustomDate = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "view".tr(),
          style: GoogleFonts.raleway(fontSize: 28, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ValueListenableBuilder(
              valueListenable: type,
              builder: (context, value, _) {
                return Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: DateTabWidget(
                          label: "today".tr(),
                          isSelected: type.value == 1,
                          ontap: () {
                            type.value = 1;
                          },
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: ValueListenableBuilder<DateTime?>(
                          valueListenable: selectedCustomDate,
                          builder: (context, customDate, _) {
                            final title = customDate == null
                                ? "yesterday".tr()
                                : DateFormat('MMMM, dd').format(customDate);
                            return DateTabWidget(
                              label: title,
                              isSelected: type.value == 2,
                              ontap: () {
                                type.value = 2;
                              },
                            );
                          },
                        ),
                      ),
                      Expanded(
                        // flex: 3,
                        child: IconButton(
                          style: IconButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: AppColor.deepPurple,
                          ),
                          onPressed: () {
                            // showDialog(
                            //   context: context,
                            //   // builder: (context) => CalendarWidget(
                            //   //   onDateSelected: (selectedDate) {
                            //   //     // bu yerda "Yesterday" o‘rnini yangilash
                            //   //     // type.value = 3;
                            //   //     selectedCustomDate.value = selectedDate;
                            //   //   },
                            //   // ),
                            // );
                          },
                          icon: SvgPicture.asset(AppImages.downArrow),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: type,
            builder: (context, value, _) {
              if (value == 1) {
                return Expanded(
                  child: _buildGridView(
                    'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79',
                  ),
                );
              }
              return Expanded(
                child: _buildGridView(
                  'https://t3.ftcdn.net/jpg/06/04/85/26/360_F_604852614_H0Ub13DqcP92Mr7e0VOKY1pICV2mi2Ea.jpg',
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(String imageUrl) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 150),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
        mainAxisSpacing: 10,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ProductItemWidget(
          img: imageUrl,
          name: 'Lorem ipsum dolor sit amet consectetur',
          price: '\$17,00',
        );
      },
    );
  }
}
