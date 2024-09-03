import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/network/local/cache/cache_helper.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_navigation.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../../splash/presentation/splash_screen.dart';

class LayoutAppBar extends StatelessWidget {
  const LayoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Hello, ${CacheHelper.getData('userName')}!',
          style: Styles.textStyle22w700.copyWith(
            fontWeight: FontWeight.w800
          ),
        ),
        Spacer(),
        InkWell(
          onTap:(){},
          child: Container(
            height:AppSize.getVerticalSize(35),
            width:AppSize.getHorizontalSize(35),
            padding: AppSize.padding(
                horizontal: 7, vertical: 7),
            decoration: AppConstants.boxDecoration,
            child: SvgPicture.asset(AppIcons.notification,
            ),
          ),
        ),
        SizedBox(width: AppSize.getHorizontalSize(7),),
        InkWell(
            onTap: () {
              CacheHelper.removeData('token');
              CacheHelper.removeData('userName');
              AppNavigator.pushAndRemove(
                  screen: SplashScreen(),
                  context: context);
            },
            child:
            Container(
                height:AppSize.getVerticalSize(35),
                width:AppSize.getHorizontalSize(35),
                padding: AppSize.padding(
                    start: 5,end: 5, vertical: 5,),
                decoration: AppConstants.boxDecoration,
                child: SvgPicture.asset(AppIcons.logout,
                /* height: 14,width: 14,
                  fit: BoxFit.fill,*/
                ),
            ),
        ),
      ],
    );
  }
}
