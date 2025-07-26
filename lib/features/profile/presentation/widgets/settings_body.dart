import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:oversize/core/constants/app_styles.dart';
import 'package:oversize/core/routes/app_router.dart';
import 'package:oversize/core/routes/export_route.dart';
import 'package:oversize/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("personal".tr(), style: AppStyle.w800s17h22Dark),
        ),
        ProfileListTile(
          ontap: () {
            context.push(AppRouter.editProfile);
          },
          title: "profile",
        ),
        ProfileListTile(
          ontap: () {
            context.push(AppRouter.shippingAdres);
          },
          title: "address",
        ),
        ProfileListTile(ontap: () {}, title: "payment"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("shop".tr(), style: AppStyle.w800s17h22Dark),
        ),
        ProfileListTile(
          ontap: _showCountryPicker,
          title: "country",
          label: _selectedCountry?.name,
        ),
        ProfileListTile(
          ontap: () {
            context.push(AppRouter.currency);
          },
          title: "currency",
        ),
        ProfileListTile(
          ontap: () {
            context.push(AppRouter.size);
          },
          title: "sizes",
        ),
        ProfileListTile(ontap: () {}, title: "terms"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("account".tr(), style: AppStyle.w800s17h22Dark),
        ),
        ProfileListTile(
          ontap: () {
            context.push(AppRouter.language);
          },
          title: "language",
          label: language(),
        ),
        // ProfileListTile(ontap: () {}, title: "About Slada"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ZoomTapAnimation(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    "You are going to delete your account",
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    "You won't be able to restore your data",
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text("cancel".tr()),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("delete".tr()),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              "logout".tr(),
              style: TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }

  String language() {
    final lan = context.locale.languageCode;
    if (lan == "uz") {
      return "O'z";
    } else if (lan == "en") {
      return "En";
    } else if (lan == "ru") {
      return "Ру";
    } else {
      return "O'z";
    }
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
      countryListTheme: CountryListThemeData(
        borderRadius: BorderRadius.circular(10),
        inputDecoration: InputDecoration(
          labelText: 'searchCountry'.tr(),
          hintText: 'searching'.tr(),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
