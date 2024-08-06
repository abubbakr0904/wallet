import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallet/screens/tab_box/profile_screen/widget/dialog_button.dart';

showImageDialog(BuildContext context,
    {required ValueChanged<XFile?> onChaneXFile}) async {
  XFile? xFile;

  Future<void> pickerImageFromGallery() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
    );

    onChaneXFile.call(xFile);
  }

  Future<void> pickerImageFromCamera() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1024,
      maxWidth: 1024,
    );

    onChaneXFile.call(xFile);
  }

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              width: 90,
              height: 7,
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DialogButtons(
                    onTab: () {
                      pickerImageFromGallery();
                      Navigator.pop(context);
                    },
                    iconData: Icons.image),
                const SizedBox(
                  width: 50,
                ),
                DialogButtons(
                    onTab: () {
                      pickerImageFromCamera();
                      Navigator.pop(context);
                    },
                    iconData: Icons.camera_alt),
              ],
            ),
          ],
        ),
      );
    },
  );
}
