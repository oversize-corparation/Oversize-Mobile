import 'package:flutter/material.dart';
import 'package:oversize/core/constants/app_colors.dart';

class CircleTickWidget extends StatelessWidget {
  final double? radius;
  final double? secondRadius;
  const CircleTickWidget({super.key, this.radius, this.secondRadius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius ?? 15,
      child: CircleAvatar(
        radius: secondRadius ?? 12,
        backgroundColor: AppColor.deepPink,
        child: const Icon(Icons.check, size: 18, color: Colors.white),
      ),
    );
  }
}
