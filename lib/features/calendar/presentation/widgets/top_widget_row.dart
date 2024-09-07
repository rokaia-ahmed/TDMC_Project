import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tdmc_project/core/utils/app_size.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';

class TopWidgetRow extends StatelessWidget {
  const TopWidgetRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('layout.calendar'.tr(),
          style: Styles.textStyle20w700.copyWith(
           // height: 0.8,
          ),
        ),
        SizedBox(
          width: AppSize.getHorizontalSize(60),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              // The progress bar
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2, // Completed
                    child: Container(
                      height: AppSize.getVerticalSize(4),
                      decoration: BoxDecoration(
                        color: AppColors.gryTextColor5,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2, // Active
                    child: Container(
                      height: AppSize.getVerticalSize(4),
                      color: AppColors.blue,
                    ),
                  ),
                  Expanded(
                    flex: 3, // Upcoming
                    child: Container(
                      height: AppSize.getVerticalSize(4),
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getVerticalSize(0)),
              // The text labels
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      'home.completed'.tr(),
                      textAlign: TextAlign.center,
                      style: Styles.textStyle10w600.copyWith(
                        color: AppColors.gryTextColor3,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'calendar.active'.tr(),
                      textAlign: TextAlign.center,
                      style: Styles.textStyle10w600.copyWith(
                        color: AppColors.gryTextColor3,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'home.upcoming'.tr(),
                      textAlign: TextAlign.center,
                      style: Styles.textStyle10w600.copyWith(
                        color: AppColors.gryTextColor3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
