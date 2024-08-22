import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';

class OtpTopWidgets extends StatelessWidget {
  const OtpTopWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:AppSize.padding(start: 15,end: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.getVerticalSize(30),
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(AppSvg.logo,
              height:AppSize.getVerticalSize(25),
              width: AppSize.getHorizontalSize(20),
            ),
          ),
          SizedBox(
            height: AppSize.getVerticalSize(20),
          ),
          SvgPicture.asset(AppSvg.otpImg,
            height:AppSize.getVerticalSize(120),
            width: AppSize.getHorizontalSize(120),
          ),
          SizedBox(
            height: AppSize.getVerticalSize(20),
          ),
          Text('Enter code',
            style:Styles.textStyle24w700,
          ),
          SizedBox(
            height: AppSize.getVerticalSize(10),
          ),
          Text('Please enter your code within next 5 minutes to avoid being logged out',
            style:Styles.textStyle14w400.copyWith(
              color:AppColors.gryTextColor,
              height: 1.7,
            ),
          ),
          SizedBox(
            height: AppSize.getVerticalSize(20),
          ),
        ],
      ),
    );
  }
}
