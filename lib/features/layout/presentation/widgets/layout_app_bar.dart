import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tdmc_project/features/notifications/presentation/screens/notifications_screen.dart';
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
        Text('${'layout.hello'.tr()}, ${CacheHelper.getData('userName')}!',
          style: Styles.textStyle22w700.copyWith(
            fontWeight: FontWeight.w800
          ),
        ),
        Spacer(),
        InkWell(
          onTap:(){
            AppNavigator.push(
                screen: NotificationsScreen(),
                context: context);
          },
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
              CacheHelper.removeData('fcm_token');
              AppNavigator.pushAndRemove(
                  screen: SplashScreen(),
                  context: context);
            },
            child:
            Container(
                height:AppSize.getVerticalSize(35),
                width: AppSize.getHorizontalSize(35),
                padding: AppSize.padding(
                    start: 5,end: 5, vertical: 5,),
                decoration: AppConstants.boxDecoration,
                child: SvgPicture.asset(
                 CacheHelper.getData('lang')=='en'?
                 AppIcons.logout :AppIcons.logout2,
                ),
            ),
        ),
      ],
    );
  }
}
