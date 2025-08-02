import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oversize/core/extension/space_extension.dart';
import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/profile/presentation/widgets/button_widget.dart';
import 'package:oversize/features/profile/presentation/widgets/profile_text_field.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  File? img;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        img = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: img != null ? FileImage(img!) : null,
                  child: img == null ? Icon(Icons.person, size: 60) : null,
                ),
                Positioned(
                  right: 0,
                  child: ProfileButton(
                    ontap: () {
                      _pickImage();
                    },
                    icon: Icon(Icons.edit, color: Colors.white),
                    color: AppColor.deepPurple,
                    radius: 20,
                  ),
                ),
              ],
            ),
            20.h,
            ProfileTextField(
              controller: _nameController,
              color: AppColor.lightBlue,
              hint: "name".tr(),
            ),
            10.h,
            ProfileTextField(
              controller: _emailController,
              color: AppColor.lightBlue,
              hint: "gmail@example.com",
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.deepPurple,
                ),
                onPressed: () {},
                child: Text(
                  "save".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
