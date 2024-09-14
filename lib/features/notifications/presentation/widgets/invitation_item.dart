import 'package:flutter/material.dart';
import 'package:tdmc_project/core/network/local/cache/cache_helper.dart';
import 'package:tdmc_project/features/notifications/data/models/invitations_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';

class InvitationItem extends StatelessWidget {
  const InvitationItem({super.key, required this.model,
    this.onTap,});
  final InvitationModel model ;
  final Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppSize.padding(
          vertical: 15,
          end: 15,
          start: 10,
        ),
        decoration: AppConstants.boxDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CacheHelper.getData('lang')=='en'?
                    model.title??'' :model.titleAr??'',
                    style: Styles.textStyle14w600
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: AppSize.getVerticalSize(5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          CacheHelper.getData('lang')=='en'?
                          model.description??'' :model.descriptionAr??'',
                          style: Styles.textStyle12w500,
                        ),
                      ),
                      /*SizedBox(
                        width: AppSize.getHorizontalSize(20),
                      ),*/
                      Text(
                        '10.Oct.2024',
                        style: Styles.textStyle12w500.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: AppSize.getHorizontalSize(30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryColor,
              size: 20,
            ),
            /*SizedBox(
              width: AppSize.getHorizontalSize(1),
            ),*/
          ],
        ),
      ),
    );
  }
}
