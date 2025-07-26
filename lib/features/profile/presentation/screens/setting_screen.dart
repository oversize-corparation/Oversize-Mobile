import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oversize/features/profile/presentation/widgets/settings_body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text("settings".tr()),
        centerTitle: true,
      ),
      body: SettingsBody(),
    );
  }
}
