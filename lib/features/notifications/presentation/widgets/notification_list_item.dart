import 'package:flutter/material.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/utils/styles.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppSize.padding(top: 6),
          child: CircleAvatar(

            backgroundColor:AppColors.blue,
            radius:3,
          ),
        ),
        SizedBox(
          width: AppSize.getHorizontalSize(10),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Invite to enroll in workshop',
              style:Styles.textStyle14w600.copyWith(
                height:1,) ,
              ),
              SizedBox(
                height: AppSize.getVerticalSize(10),
              ),
              Text('Movenpick - Business Email Writing',
              style:Styles.textStyle12w500.copyWith(
                color: AppColors.gryTextColor7
              ),
              ),
            ],
          ),
        ),
        Text('4 days ago',
        style:Styles.textStyle10w600.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.gryTextColor3
        ),
        ),
      ],
    );
  }
}
