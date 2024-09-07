import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/utils/styles.dart';
import 'package:tdmc_project/core/widgets/custom_arrow_back.dart';

import '../widgets/notification_list.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSize.padding(
            all: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             CustomArrowBack(),
             SizedBox(
               height: AppSize.getVerticalSize(10),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('notifications.title'.tr(),
                  style:Styles.textStyle24w600,
                 ),
                 InkWell(
                   onTap:(){},
                   child: Card(
                     elevation: 3,
                     child:Padding(
                       padding: AppSize.padding(
                         vertical: 7, horizontal: 15),
                       child: Text('Mark all as read',
                         style:Styles.textStyle14w600.copyWith(
                           color: AppColors.primaryColor,
                           fontWeight: FontWeight.w700,
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
             Row(
               children: [
                 Text('You have',
                   style:Styles.textStyle14w400.copyWith(
                     color: AppColors.gryTextColor,
                   ),
                 ),
                 SizedBox(
                   width: AppSize.getHorizontalSize(5),
                 ),
                 Text('2 Notifications .',
                   style:Styles.textStyle14w400.copyWith(
                     color: AppColors.secondColor,
                   ),
                 ),
               ],
             ),
             SizedBox(
               height: AppSize.getVerticalSize(20),
             ),
             NotificationList(),
           ],
          ),
        ),
      ),
    );
  }
}
