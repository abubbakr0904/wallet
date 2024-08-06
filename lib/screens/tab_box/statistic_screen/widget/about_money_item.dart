import 'package:flutter/material.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

class AboutMoneyItem extends StatelessWidget {
  const AboutMoneyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 2,
                color : AppColors.appMainColor
            )
        ),
        child : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("250.000" , style: AppTextStyle.montserratBlack.copyWith(
                    color : Colors.black,
                    fontSize: 30
                ),),
                Text("Kirim" , style: AppTextStyle.montserratBlack.copyWith(
                    color : Colors.black,
                    fontSize: 15
                ),),
              ],
            ),
            Container(
              width: 5,
              height: 80,
              decoration: BoxDecoration(
                  color : AppColors.appMainColor,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Column(
              children: [
                Text("-46.000" , style: AppTextStyle.montserratBlack.copyWith(
                    color : Colors.black,
                    fontSize: 30
                ),),
                Text("Chiqim" , style: AppTextStyle.montserratBlack.copyWith(
                    color : Colors.black,
                    fontSize: 15
                ),),
              ],
            ),
          ],
        )
    );
  }
}
