import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/widgets/custom_error_widget.dart';
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
            CustomError3(
                error: 'calendar.no_workshop'.tr());
          }else if(state is Error){
             return CustomError3(
                 error: state.errorMsg);
           }
           else{
             return Container() ;
           }
        },
      );
  }
}
