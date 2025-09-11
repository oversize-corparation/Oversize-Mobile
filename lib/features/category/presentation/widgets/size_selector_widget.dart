import 'package:flutter/material.dart';
import 'package:oversize/core/constants/app_colors.dart';
import 'package:oversize/core/constants/app_decorations.dart';
import 'package:oversize/core/constants/app_styles.dart';

class SizeSelector extends StatefulWidget {
  final bool isClothes;
  const SizeSelector({super.key, this.isClothes = true});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  final List<String> sizes = ["XS", "S", "M", "L", "XL", "2XL"];
  final List<String> shoeSizes = ["36", "37", "38", "39", "40", "41", "42"];

  int clothesIndex = 0;
  int shoesIndex = 0;

  List<String> get activeSize => widget.isClothes ? sizes : shoeSizes;
  int get selectedIndex => widget.isClothes ? clothesIndex : shoesIndex;

  set selectedIndex(int value) {
    if (widget.isClothes) {
      clothesIndex = value;
    } else {
      shoesIndex = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 40,
            decoration: AppDecorations.lightPinkBorderR20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: activeSize.asMap().entries.map((entry) {
                final index = entry.key;
                final size = entry.value;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Center(
                      child: Text(size, style: AppStyle.w800s13Ralewaypink),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment(
              -1.0 + (2 * selectedIndex / (activeSize.length - 1)),
              0,
            ),
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.lightGray400,
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  activeSize[selectedIndex],
                  style: AppStyle.w800s13Ralewaypink.copyWith(
                    color: AppColor.deepPink,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
