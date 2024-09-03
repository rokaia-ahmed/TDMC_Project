import 'package:flutter/material.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import '../../../../core/utils/app_radius.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/data/models/workshops_model.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({super.key, required this.model});
  final Result model ;
  @override
  Widget build(BuildContext context) {
    String modifiedStart = model.fromDate!
        .substring(5,10)
        .replaceAll('-', '/');
    String modifiedEnd = model.toDate!
        .substring(5,10)
        .replaceAll('-', '/');
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      borderRadius:AppRadius.radius20,
     border:Border.all(
       color: AppColors.lightGry,
       width: 1,
     ),
      ),
      child:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Text('${modifiedStart}',
            style:Styles.textStyle14w400.copyWith(
              color: AppColors.gryTextColor4.withOpacity(0.7),
            ),
            ),
            SizedBox(
              width: AppSize.getHorizontalSize(25),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.companyName??'',
                    style:Styles.textStyle16w700,
                  ),
                  SizedBox(height: AppSize.getVerticalSize(3),),
                  Text('${model.venueName??''} - ${model.topicName}',
                    style:Styles.grayText,
                  ),
                  SizedBox(height: AppSize.getVerticalSize(10)),
                  Text('${modifiedStart} - ${modifiedEnd}',
                    textAlign:TextAlign.center,
                    style:Styles.textStyle12w600.copyWith(
                      color: AppColors.gryTextColor5,
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
