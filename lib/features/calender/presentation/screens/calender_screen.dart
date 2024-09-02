import 'package:flutter/material.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/utils/styles.dart';
import '../widgets/calander.dart';
import '../widgets/daily_workshop.dart';
import '../widgets/top_widget_row.dart';


class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppSize.padding(all: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height:AppSize.getVerticalSize(5),
            ),
            TopWidgetRow(),
            SizedBox(
              height:AppSize.getVerticalSize(5),
            ),
            /// calendar
            Calendar(),
            SizedBox(
              height:AppSize.getVerticalSize(10),
            ),
            Text('DAILY WORKSHOP',
              style: Styles.textStyle18w600.copyWith(
                color: AppColors.gryTextColor4,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(
              height:AppSize.getVerticalSize(10),
            ),
            /// daily workshop
            DailyWorkshop(),
          ],
        ),
      ),
    );
  }
}
