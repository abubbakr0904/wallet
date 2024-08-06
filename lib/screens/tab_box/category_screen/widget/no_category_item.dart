import 'package:flutter/material.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

import '../../../../utils/colors/app_colors.dart';

class NoCategoryItem extends StatelessWidget {
  const NoCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 230,),
            const Icon(
              Icons.category_outlined,
              color : AppColors.appMainColor,
              size: 150,
            ),
            Text("No category" , style: AppTextStyle.montserratBlack.copyWith(
                color : Colors.black,
                fontSize: 40
            ),)
          ],
        )
    );
  }
}
