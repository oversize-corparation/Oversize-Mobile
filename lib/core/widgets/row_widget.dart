import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oversize/core/constants/app_styles.dart';

class RowWidget extends StatelessWidget {
  final String title;
  const RowWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr(),
          style: AppStyle.w700s18h34DarkBluePrimary.copyWith(fontSize: 21),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'all'.tr(),
                style: AppStyle.w700s18h34DarkBluePrimary.copyWith(
                  fontSize: 14,
                ),
              ),
              WidgetSpan(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Color(0xFF2B3A55),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
