import 'package:oversize/features/app/app_export.dart';

class CategoriesCircle extends StatelessWidget {
  const CategoriesCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        // childAspectRatio: 1,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.boxShadow,
                spreadRadius: 0,
                blurRadius: 8,
              ),
            ],
          ),
          child: CircleAvatar(backgroundColor: Colors.amber),
        );
      },
    );
  }
}
