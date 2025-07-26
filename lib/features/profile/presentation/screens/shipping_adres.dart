import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oversize/features/profile/presentation/widgets/shipping_address_body.dart';

class ShippingAdres extends StatelessWidget {
  const ShippingAdres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("address".tr()),
      ),
      body: ShippingAddressBody(),
    );
  }
}
