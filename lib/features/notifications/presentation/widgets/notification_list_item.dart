import 'package:flutter/material.dart';
import 'package:tdmc_project/core/network/local/cache/cache_helper.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/utils/styles.dart';
import 'package:tdmc_project/features/notifications/data/models/notification_model.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({super.key,
    required this.onTap, required this.model});
  final Function() onTap ;
  final NotificationModel model ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(model.isRead==false)
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
                Text(CacheHelper.getData('lang')=='en'?
                model.description??'':
                model.descriptionAr??'' ,
                style:Styles.textStyle14w600.copyWith(
                  //height:1,
                ) ,
                ),
               /* SizedBox(
                  height: AppSize.getVerticalSize(5),
                ),
                Text('Movenpick - Business Email Writing',
                style:Styles.textStyle12w500.copyWith(
                  color: AppColors.gryTextColor7
                ),
                ),*/
              ],
            ),
          ),
          SizedBox(
            width: AppSize.getHorizontalSize(10),
          ),
          Text('${model.createdOn?.substring(0,10)}',
          style:Styles.textStyle10w600.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.gryTextColor3
          ),
          ),
        ],
      ),
    );
  }
}
