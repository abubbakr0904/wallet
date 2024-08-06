import 'package:flutter/material.dart';
import 'package:wallet/screens/tab_box/statistic_screen/widget/about_money_item.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

class StatistciScreen extends StatefulWidget {
  const StatistciScreen({super.key});

  @override
  State<StatistciScreen> createState() => _StatistciScreenState();
}

class _StatistciScreenState extends State<StatistciScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Statistics screen",
          style: AppTextStyle.montserratBlack
              .copyWith(color: AppColors.appMainColor, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const AboutMoneyItem(),
            ...List.generate(
              10,
              (index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(
                    top: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: index % 2 == 0 ? Colors.red : Colors.blue,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        index % 2 == 0 ? "-12.000" : "12.000",
                        style: AppTextStyle.montserratSemiBold.copyWith(
                            color: index % 2 == 0 ? Colors.red : Colors.blue,
                            fontSize: 20),
                      ),
                      Icon(
                        index % 2 == 0
                            ? Icons.arrow_upward
                            : Icons.arrow_downward_rounded,
                        color: index % 2 == 0 ? Colors.red : Colors.blue,
                        size: 20,
                      )
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
