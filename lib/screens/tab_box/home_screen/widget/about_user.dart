import 'package:flutter/material.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/images/app_images.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

class AboutUser extends StatelessWidget {
  const AboutUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border:
              Border.all(width: 4, color: AppColors.appMainColor)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              AppImages.imgAvatar,
              width: 70,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          "Abubakr",
          style: AppTextStyle.montserratBlack
              .copyWith(color: Colors.black, fontSize: 25),
        ),
      ],
    );
  }
}
