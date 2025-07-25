import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:oversize/features/auth/presentation/auth.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    ); // Yoki ImageSource.camera

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: _imageFile == null
          ? SizedBox(
              width: 90,
              height: 90,
              child: DottedBorder(
                options: OvalDottedBorderOptions(
                  dashPattern: [20, 5],
                  strokeWidth: 2,
                  color: AppColor.deepPurple,
                ),
                child: Center(
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColor.deepPurple,
                  ),
                ),
              ),
            )
          : Container(
              width: 105,
              height: 105,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColor.boxShadow,
                    offset: Offset(0, 0),
                    blurRadius: 5,
                    spreadRadius: 0,
                  ),
                ],
                shape: BoxShape.circle,
                color: AppColor.white,
              ),
              child: ClipOval(
                child: Image.file(
                  _imageFile!,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
