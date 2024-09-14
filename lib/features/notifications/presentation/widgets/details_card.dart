import 'package:flutter/material.dart';
import 'package:tdmc_project/core/utils/app_radius.dart';
import '../../../../core/network/local/cache/cache_helper.dart';
import '../../../../core/utils/app_shadow.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/invitations_details_model.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key, this.onTap,required this.model});
  final Function()? onTap ;
  final InvitationsDetailsModel model ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        decoration:BoxDecoration(
          borderRadius:AppRadius.radius20,
          boxShadow:AppShadows.custom,
        ),
        child: Card(
          margin: EdgeInsets.zero,
          // elevation: 1.5,
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(CacheHelper.getData('lang')=='en'?
                model.companyName??'':model.companyNameAr??'',
                  style:Styles.textStyle16w700,
                ),
                SizedBox(height: AppSize.getVerticalSize(5),),
                Text('${CacheHelper.getData('lang')=='en'?
                model.venueName??'':model.venueNameAr??''} - ${
                    CacheHelper.getData('lang')=='en'?
                    model.topicName??'':model.topicNameAr??''}',
                  style:Styles.grayText,
                ),
                SizedBox(height: AppSize.getVerticalSize(5),),
                Text(model.fromDate!,
                  style:Styles.textStyle12w600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
