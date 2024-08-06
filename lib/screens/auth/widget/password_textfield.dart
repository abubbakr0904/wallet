import 'package:flutter/material.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

class PasswordTextFieldItem extends StatelessWidget {
  const PasswordTextFieldItem({super.key, required this.controller, required this.hintText, required this.onTap, required this.eye});
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onTap;
  final bool eye;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppTextStyle.montserratSemiBold,
      obscureText: eye,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onTap,
          icon : const Icon(
            Icons.remove_red_eye,
            color : Colors.black
          )
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.montserratSemiBold.copyWith(
            color : Colors.black.withOpacity(0.7)
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
                color: Colors.black,
                width: 2
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
                color: Colors.black,
                width: 2
            )
        ),
      ),
    );
  }
}
