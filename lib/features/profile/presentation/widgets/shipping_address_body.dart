import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oversize/features/profile/presentation/widgets/profile_text_field.dart';
import 'package:oversize/features/app/app_export.dart';

class ShippingAddressBody extends StatefulWidget {
  const ShippingAddressBody({super.key});

  @override
  State<ShippingAddressBody> createState() => _ShippingAddressBodyState();
}

class _ShippingAddressBodyState extends State<ShippingAddressBody> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCountry;
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _postcodeController = TextEditingController();
  final _phoneController = TextEditingController();

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country.name;
        });
      },
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _postcodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('country'.tr(), style: TextStyle(fontSize: 16)),
                GestureDetector(
                  onTap: _showCountryPicker,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              _selectedCountry ?? 'chooseContry'.tr(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('adrs'.tr(), style: TextStyle(fontSize: 16)),
            ProfileTextField(
              controller: _addressController,
              hint: 'required'.tr(),
              color: AppColor.lightGray400,
            ),
            SizedBox(height: 16),
            Text('city'.tr(), style: TextStyle(fontSize: 16)),
            ProfileTextField(
              controller: _cityController,
              hint: 'required'.tr(),
              color: AppColor.lightGray400,
            ),
            SizedBox(height: 16),
            Text('postcode'.tr(), style: TextStyle(fontSize: 16)),
            ProfileTextField(
              controller: _postcodeController,
              hint: 'required'.tr(),
              color: AppColor.lightGray400,
            ),
            SizedBox(height: 16),
            Text('phoneNumber'.tr(), style: TextStyle(fontSize: 16)),
            ProfileTextField(
              controller: _phoneController,
              hint: 'required'.tr(),
              color: AppColor.lightGray400,
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Ma'lumotlarni saqlash logikasi
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('save'.tr())));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'save'.tr(),
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
