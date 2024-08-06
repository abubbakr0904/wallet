import 'package:flutter/material.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.appMainColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Text(
              text,
              style: AppTextStyle.montserratBlack
                  .copyWith(color: AppColors.white, fontSize: 20),
            ),
          )),
    );
  }
}
