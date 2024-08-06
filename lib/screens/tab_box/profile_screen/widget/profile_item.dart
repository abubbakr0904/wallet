import 'package:flutter/material.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 2,
                  color : AppColors.appMainColor
              )
          ),
          child : Text(text , style: AppTextStyle.montserratSemiBold.copyWith(
              color : Colors.black,
              fontSize: 20
          ),)
      ),
    );
  }
}
