import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_radius.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../logic/assignments_cubit.dart';

class UnansweredQuestions extends StatelessWidget {
  const UnansweredQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<AssignmentsCubit, AssignmentsState>(
        builder: (context, state) {
          var cubit = AssignmentsCubit.get(context);
          return (cubit.unansweredList.isNotEmpty)?
           Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: AppSize.getVerticalSize(10),
              ),
              Padding(
                padding: AppSize.padding(start: 15),
                child: Text(
                  'Unanswered questions\n'
                      '(Click on the number to go to the question)',
                  style: Styles.textStyle14w400.copyWith(
                    height: 1.2,
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.getVerticalSize(10),
              ),
              Wrap(
                alignment: WrapAlignment.end,
                runSpacing:AppSize.getVerticalSize(10) ,
                children: cubit.unansweredList.map(
                      (e) =>
                      InkWell(
                        onTap: (){
                          cubit.pageController.jumpToPage(e-1);
                        },
                        child: Container(
                          height: AppSize.getVerticalSize(22),
                          width: AppSize.getHorizontalSize(26),
                          margin: AppSize.margin(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: AppRadius.radius5,
                              color: AppColors.gryColor2
                          ),
                          child: Center(
                            child: Text('$e',
                              style: Styles.textStyle16w700.copyWith(
                                color: AppColors.gryTextColor3,
                              ),
                            ),
                          ),
                        ),
                      ),
                ).toList(),
              ),
            ],
          ):Container();
        },
      );
  }
}
