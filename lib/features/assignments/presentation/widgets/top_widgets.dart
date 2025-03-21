import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/network/local/cache/cache_helper.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_arrow_back.dart';
import '../../data/models/questions_model.dart';

class TopTitlesWidget extends StatelessWidget {
  const TopTitlesWidget({super.key, required this.model});
 final  AssignmentsModel model ;
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: AppSize.padding(horizontal: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomArrowBack(),
              SizedBox(
                width: AppSize.getHorizontalSize(10),
              ),
              Text(
                CacheHelper.getData('lang')=='en'?
                model.company??'':model.companyAr??'',
                style: Styles.textStyle28w700,
              ),
            ],
          ),
          SizedBox(
            height: AppSize.getVerticalSize(10),
          ),
          Text(
            'assignments.evaluation'.tr(),
            style: Styles.textStyle24w700.copyWith(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: AppSize.getVerticalSize(9),
          ),
          Text(
            CacheHelper.getData('lang')=='en'?
            model.workshopTitle??'':model.workshopTitleAr??'',
            style: Styles.textStyle18w700,
          ),
          SizedBox(
            height: AppSize.getVerticalSize(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.dateFrom??'',
                style: Styles.textStyle14w400,
              ),
              Text(
                model.toDate??'',
                style: Styles.textStyle14w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
