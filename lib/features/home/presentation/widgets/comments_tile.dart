import 'package:flutter/material.dart';
import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/extension/space_extension.dart';

class CommentsTile extends StatelessWidget {
  final String viewerName;
  final String comment;
  final int? maxLines;
  final double rating;

  const CommentsTile({
    super.key,
    required this.viewerName,
    required this.comment,
    this.maxLines,
    this.rating = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: AppDecorations.contaynerBlurCircle,
          child: CircleAvatar(backgroundColor: Colors.amber, radius: 25),
        ),
        20.w,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(viewerName, style: AppStyle.w600s16h22DarkBluePrimary),
              4.h,
              Row(
                children: [
                  ...List.generate(5, (index) {
                    return Icon(
                      index < rating.floor()
                          ? Icons.star
                          : (index < rating && rating % 1 != 0)
                          ? Icons.star_half
                          : Icons.star_border,
                      color: Colors.amber,
                      size: 16,
                    );
                  }),
                ],
              ),
              10.h,
              Text(
                comment,
                style: AppStyle.w400s13h18DarkBlue300,
                maxLines: maxLines,
                overflow: maxLines != null
                    ? TextOverflow.ellipsis
                    : TextOverflow.visible,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
