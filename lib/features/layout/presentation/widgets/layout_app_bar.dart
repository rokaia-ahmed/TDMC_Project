import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/network/local/cache/cache_helper.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_navigation.dart';
import '../../../../core/utils/app_radius.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../../splash/presentation/splash_screen.dart';

class LayoutAppBar extends StatelessWidget {
  const LayoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSize.padding(all: 12),
      child: Row(
        children: [
          Text('Hello, ${CacheHelper.getData('userName')}!',
            style: Styles.textStyle24w700,
          ),
          Spacer(),
          Container(
            padding: AppSize.padding(
                horizontal: 7, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: AppRadius.radius10,
            ),
            child: SvgPicture.asset(AppIcons.notification),
          ),
          SizedBox(width: AppSize.getHorizontalSize(15),),
          InkWell(
              onTap: () {
                CacheHelper.removeData('token');
                CacheHelper.removeData('userName');
                AppNavigator.pushAndRemove(
                    screen: SplashScreen(),
                    context: context);
              },
              child: SvgPicture.asset(AppIcons.logout)),
        ],
      ),
    );
  }
}
