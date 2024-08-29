import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tdmc_project/core/utils/app_navigation.dart';
import 'package:tdmc_project/core/utils/styles.dart';
import 'package:tdmc_project/core/widgets/custom_buttons.dart';
import 'package:tdmc_project/features/layout/presentation/screens/layout_screen.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_size.dart';

class AssignmentsSuccess extends StatelessWidget {
  const AssignmentsSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSize.getVerticalSize(80),
            ),
          SvgPicture.asset(AppSvg.success,
           height: 240,
            width: 300,
            fit: BoxFit.cover,
          ),
            SizedBox(
              height: AppSize.getVerticalSize(10),
            ),
            Text('The assignment was sent successfully',
            style: Styles.textStyle24w700,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: AppSize.getVerticalSize(5),
            ),
            Text('Please check your email to view the results',
              textAlign: TextAlign.center,
              style: Styles.grayText.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: AppSize.getVerticalSize(15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomDefaultButton(text:'Go Home',
                width: AppSize.getHorizontalSize(60),
                onTap: () {
                  AppNavigator.pushAndRemove(
                      screen: LayoutScreen(),
                      context: context);
                },
                ),
              ],
            ),
            Spacer(),
            SvgPicture.asset(AppSvg.logo,
              width:AppSize.getVerticalSize(100),
              height: AppSize.getVerticalSize(20),
            ),
            SizedBox(
              height: AppSize.getVerticalSize(40),
            ),
          ],
        ),
      ),
    );
  }
}
