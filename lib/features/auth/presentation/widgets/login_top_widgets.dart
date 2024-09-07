import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';

class LoginTopWidget extends StatelessWidget {
  const LoginTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSize.getVerticalSize(30),
        ),
        Text('auth.welcome'.tr(),
          style:Styles.textStyle32w700,
        ),
        SizedBox(
          height: AppSize.getVerticalSize(50),
        ),
        SvgPicture.asset(AppSvg.logo,
          width:AppSize.getVerticalSize(270),
          height: AppSize.getVerticalSize(50),
        ),
        SizedBox(
          height: AppSize.getVerticalSize(40),
        ),
        Text('auth.enter'.tr(),
          style:Styles.textStyle20w500,
        ),
        SizedBox(
          height: AppSize.getVerticalSize(15),
        ),
      ],
    );
  }
}
