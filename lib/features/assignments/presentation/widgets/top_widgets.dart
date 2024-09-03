import 'package:flutter/material.dart';

import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_arrow_back.dart';
import '../../../home/data/models/workshops_model.dart';

class TopTitlesWidget extends StatelessWidget {
  const TopTitlesWidget({super.key, required this.model});
 final  Result model ;
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
                model.companyName??'',
                style: Styles.textStyle28w700,
              ),
            ],
          ),
          SizedBox(
            height: AppSize.getVerticalSize(10),
          ),
          Text(
            'Evaluation:',
            style: Styles.textStyle24w700.copyWith(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: AppSize.getVerticalSize(9),
          ),
          Text(
            model.topicName??'',
            style: Styles.textStyle18w700,
          ),
          SizedBox(
            height: AppSize.getVerticalSize(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.fromDate??'',
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
