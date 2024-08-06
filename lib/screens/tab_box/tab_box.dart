import 'package:flutter/material.dart';
import 'package:wallet/screens/tab_box/category_screen/category_screen.dart';
import 'package:wallet/screens/tab_box/statistic_screen/statistci_screen.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import '../../utils/styles/app_text_styles.dart';
import 'home_screen/home_screen.dart';
import 'profile_screen/profile_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      const HomeScreen(),
      const CategoryScreen(),
      const StatistciScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _activeIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        backgroundColor: Colors.white,
        selectedLabelStyle: AppTextStyle.montserratSemiBold.copyWith(
            color : AppColors.appMainColor
        ),
        selectedItemColor: AppColors.appMainColor,
        unselectedLabelStyle: AppTextStyle.montserratRegular.copyWith(
            color : AppColors.appMainColor,
            fontSize: 14
        ),
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color : AppColors.appMainColor
            ),
            icon: Icon(
              Icons.home,
              color : AppColors.appMainColor
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.category,
              color : AppColors.appMainColor
            ),
            icon: Icon(
              Icons.category,
              color : AppColors.appMainColor
            ),
            label: "Category",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.stacked_bar_chart,
              color : AppColors.appMainColor
            ),
            icon: Icon(
              Icons.stacked_bar_chart,
              color : AppColors.appMainColor
            ),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.manage_accounts,
              color : AppColors.appMainColor
            ),
            icon: Icon(
              Icons.manage_accounts,
              color : AppColors.appMainColor
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}