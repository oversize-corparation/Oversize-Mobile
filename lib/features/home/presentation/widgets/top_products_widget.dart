import 'package:oversize/features/app/app_export.dart';

class TopProductsWidget extends StatelessWidget {
  const TopProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: 6,
        separatorBuilder: (context, index) => 14.w,
        itemBuilder: (context, index) {
          return const CircleAvatar(radius: 30, backgroundColor: Colors.amber);
        },
      ),
    );
  }
}
