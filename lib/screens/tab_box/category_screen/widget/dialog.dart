import 'package:flutter/material.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

Future getDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Text(
          'Do you want to remove',
          style: AppTextStyle.montserratSemiBold
              .copyWith(color: Colors.black, fontSize: 30),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style:
                  TextButton.styleFrom(backgroundColor: AppColors.appMainColor),
              child: Text(
                'Yes',
                style: AppTextStyle.montserratSemiBold.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      );
    },
  );
}
