import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tdmc_project/core/network/local/cache/cache_helper.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/utils/styles.dart';
import '../../../layout/presentation/widgets/layout_app_bar.dart';
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
            /// app bar
            LayoutAppBar(),
            SizedBox(
              height:AppSize.getVerticalSize(20),
            ),
            /// top row
            TopWidgetRow(),
            SizedBox(
              height:AppSize.getVerticalSize(5),
            ),
            /// calendar
            Calendar(),
            SizedBox(
              height:AppSize.getVerticalSize(15),
            ),
            Text('calendar.daily_workshop'.tr(),
              style: Styles.textStyle18w600.copyWith(
                color: AppColors.gryTextColor4,
                letterSpacing:CacheHelper.getData('lang')=='en'?
                1.5:null,
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
