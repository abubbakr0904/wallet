import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallet/data/local/storage_repository.dart';
import 'package:wallet/screens/tab_box/profile_screen/widget/profile_item.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/images/app_images.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

import 'widget/image_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  XFile? xFile;
  String image = "";

  init(){
    image = StorageRepository.getString("user_image");
  }

  @override
  void initState() {
    init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile screen",
          style: AppTextStyle.montserratBlack
              .copyWith(color: AppColors.appMainColor, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child:xFile != null
                      ? Image.file(
                    File(xFile!.path),
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  )
                      : Image.asset(
                      AppImages.imgAvatar , width: 150 , fit : BoxFit.cover,)),
              IconButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.appMainColor
                ),
                onPressed: () {
                  showImageDialog(
                    context,
                    onChaneXFile: (value) async {
                      xFile = value;
                      print(xFile!.path + "\n\n\n\n\n\n\n");
                      setState(() {});
                    },
                  );
                },
                icon: const Icon(Icons.edit, color: Colors.red),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const ProfileItem(
            text: "Abubakr",
            onTap: null,
          ),
          ProfileItem(
            text: "Password",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
