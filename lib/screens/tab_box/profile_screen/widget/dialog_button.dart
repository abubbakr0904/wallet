import 'package:flutter/material.dart';
import 'package:wallet/utils/colors/app_colors.dart';

class DialogButtons extends StatelessWidget {
  const DialogButtons({super.key, required this.onTab, required this.iconData});

  final VoidCallback onTab;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        side: const BorderSide(color: AppColors.appMainColor, width: 3),
      ),
      onPressed: onTab,
      child: Icon(
        iconData,
        size: 40,
        color: AppColors.appMainColor,
      ),
    );
  }
}
