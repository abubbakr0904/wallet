import 'package:flutter/material.dart';
import 'package:wallet/screens/tab_box/home_screen/widget/about_user.dart';
import 'package:wallet/screens/tab_box/statistic_screen/widget/about_money_item.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            const AboutUser(),
            const SizedBox(height: 15),
            const AboutMoneyItem(),
            ...List.generate(
              10,
                  (index) {
                final isPositive = index % 2 != 0;
                final amountColor = isPositive ? Colors.blue : Colors.red;
                final amountText = isPositive ? "12.000" : "-12.000";
                final icon = isPositive ? Icons.arrow_downward_rounded : Icons.arrow_upward;

                return Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: amountColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        amountText,
                        style: AppTextStyle.montserratSemiBold.copyWith(
                          color: amountColor,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        icon,
                        color: amountColor,
                        size: 20,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
