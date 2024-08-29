import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_radius.dart';
import '../../../../core/utils/app_shadow.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/questions_model.dart';

class BuildOptionContainer extends StatelessWidget {
  const BuildOptionContainer({super.key, this.onTap, required this.model, required this.optionLetter});

  final Function()? onTap;
  final QuestionOptions model;
  final String optionLetter;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppSize.padding(vertical: 7, end: 10),
        margin: AppSize.padding(start: 15, bottom: 5,end:2),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          boxShadow: AppShadows.custom1,
          borderRadius: AppRadius.radius15,
          color:model.isSelect? AppColors.lightBlue:
          Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: AppSize.padding(horizontal: 13,
                  vertical: 3),
              decoration: BoxDecoration(
                borderRadius: AppRadius.radius20,
                color: AppColors.secondColor,
              ),
              child: Text(
                optionLetter,
                style: Styles.textStyle18w600.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              width: AppSize.getHorizontalSize(10),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// option in en
                  Text(
                    model.description ?? '',
                    style: Styles.textStyle16w400,
                  ),
                  SizedBox(
                    height: AppSize.getVerticalSize(2),
                  ),

                  /// option in ar
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      model.descriptionAr ?? '',
                      style: Styles.textStyle15w400,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}