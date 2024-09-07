import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/logic/home_cubit.dart';
import 'calendar_item.dart';

class DailyWorkshop extends StatelessWidget {
  const DailyWorkshop({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<HomeCubit,HomeState>(
        builder: (context, state) {
          var cubit =HomeCubit.get(context);
           if(state is Success ){
            return (cubit.searchResults.isNotEmpty)?
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    CalendarItem(model: cubit.searchResults[index]),
                separatorBuilder: (context, index) =>
                    SizedBox(
                      height: AppSize.getVerticalSize(10),
                    ),
                itemCount: cubit.searchResults.length):
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.getVerticalSize(70),
                ),
                Center(child: Text('calendar.no_workshop'.tr(),
                  style: Styles.textStyle16w700.copyWith(
                    color: AppColors.gryTextColor3,
                    letterSpacing: 1.5,
                  ),
                ),
                ),
                SizedBox(
                  height: AppSize.getVerticalSize(70),
                ),
              ],
            );
          }else{
             return Container() ;
           }
        },
      );
  }
}
