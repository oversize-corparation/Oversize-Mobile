import 'package:flutter/material.dart';
import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';

class FleshTime extends StatelessWidget {
  final String time;
  final bool color;
  const FleshTime({super.key, required this.time, this.color = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 33,
      decoration: color ? AppDecorations.flashInk : AppDecorations.flashwhite,
      child: Center(
        child: Text(
          time,
          style: AppStyle.w700s15Raleway.copyWith(fontSize: 17),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
