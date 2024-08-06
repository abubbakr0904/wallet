import 'package:flutter/material.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

class TextFieldItem extends StatelessWidget {
  const TextFieldItem({super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppTextStyle.montserratSemiBold,
      decoration: InputDecoration(
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
