import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';

class InvitationsContainer extends StatelessWidget {
  const InvitationsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.getVerticalSize(133),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('notifications.you_invited'.tr(),
            style: Styles.textStyle24w700.copyWith(
              // height:1,
            ),
          ),
          SizedBox(
            height: AppSize.getVerticalSize(5),
          ),
          Text('notifications.to_enroll'.tr(),
            style: Styles.textStyle14w400.copyWith(
                color: AppColors.gryTextColor7
            ),
          ),
        ],
      ),
    );
  }
}
