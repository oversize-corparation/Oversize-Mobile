import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oversize/core/constants/app_colors.dart';

class CategoriesBox extends StatelessWidget {
  const CategoriesBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: [
          GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.6,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColor.bubble3,
                    ),
                    // child: Image.network(
                    //   'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1zmZ4r.img?w=1280&h=720&m=4&q=79',
                    //   fit: BoxFit.fitHeight,
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Text("data", style: TextStyle()),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
