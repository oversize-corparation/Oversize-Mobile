import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/features/app/app_export.dart';
import 'package:oversize/features/home/presentation/widgets/comments_tile.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("review".tr(), style: AppStyle.w700s28Raleway),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => 20.h,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        itemCount: 10,
        itemBuilder: (context, index) {
          return CommentsTile(
            rating: 4,
            viewerName: "Veronika",
            comment:
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed ",
          );
        },
      ),
    );
  }
}
