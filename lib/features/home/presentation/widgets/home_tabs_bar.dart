import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';

class HomeTabsBar extends StatelessWidget {
  const HomeTabsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ButtonsTabBar(
        unselectedBackgroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        labelStyle:Styles.textStyle16w600.copyWith(
          color: Colors.white,
        ),
        unselectedLabelStyle: Styles.textStyle16w600.copyWith(
          color: AppColors.primaryColor,
        ),
        radius: 10,
        physics: NeverScrollableScrollPhysics(),
        buttonMargin:EdgeInsets.only(right: 40),
        splashColor:AppColors.primaryColor.withOpacity(0.2) ,
        contentCenter: true,
        contentPadding:EdgeInsets.symmetric(horizontal: 17),
        height: AppSize.getVerticalSize(40),
        tabs: [
          Tab(text:'Enrolled'),
          Tab(text:'completed'),
          Tab(text:'upcoming'),
        ],
      ),
    );
  }
}


