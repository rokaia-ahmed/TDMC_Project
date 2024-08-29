import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_navigation.dart';
import 'package:tdmc_project/core/utils/styles.dart';
import 'package:tdmc_project/features/layout/presentation/screens/layout_screen.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_size.dart';

class AssignmentsSuccess extends StatelessWidget {
  const AssignmentsSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:Alignment.bottomCenter ,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3,), // Apply blur effect
          child: Container(
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(20),
              topRight:Radius.circular(20),
            ),
          ),
          height:MediaQuery.of(context).size.height * 0.65,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.getVerticalSize(10),
                ),
                Container(
                  height:AppSize.getVerticalSize(6) ,
                  width: AppSize.getHorizontalSize(60),
                  color:AppColors.borderColor,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: (){
                        AppNavigator.pushAndRemove(
                            screen: LayoutScreen(),
                            context: context);
                      },
                      child:Padding(
                        padding:AppSize.padding(
                          horizontal: 15,top: 10),
                        child: Icon(Icons.cancel_outlined,
                        color: AppColors.secondColor,
                        size: 27,
                        ),
                      ),
                  ),
                ),
              SvgPicture.asset(AppSvg.success,
               height: AppSize.getVerticalSize(250),
                width:AppSize.getHorizontalSize(350) ,
                fit: BoxFit.fill,
              ),
                SizedBox(
                  height: AppSize.getVerticalSize(10),
                ),
                Text('The assignment was sent successfully',
                style: Styles.textStyle24w700.copyWith(
                  height: 1.3,
                ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppSize.getVerticalSize(5),
                ),
                Text('Please check your email to view the results',
                  textAlign: TextAlign.center,
                  style: Styles.grayText.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                SvgPicture.asset(AppSvg.logo,
                  width:AppSize.getVerticalSize(100),
                  height: AppSize.getVerticalSize(19),
                ),
                SizedBox(
                  height: AppSize.getVerticalSize(30),
                ),
              ],
            ),
        ),
      ],
    );

  }
}
