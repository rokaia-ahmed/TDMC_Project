import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_constants.dart';
import 'package:tdmc_project/core/utils/app_radius.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/utils/styles.dart';
import 'package:tdmc_project/features/Assignments/logic/assignments_cubit.dart';
import 'package:tdmc_project/features/Assignments/presentation/widgets/unanswered_questions.dart';
import '../../data/models/questions_model.dart';
import 'BuildOptionContainer.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.model,
      required this.progressCount,
      required this.totalNumber,
        required this.numOfQuestion});

  final QuestionsModel model;
  final int progressCount;
  final int numOfQuestion;
  final int totalNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// number of question row
        Padding(
          padding: AppSize.padding(horizontal: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: AppSize.padding(vertical: 5, horizontal: 10),
                decoration: AppConstants.boxDecoration,
                child: Text(
                  'Questions $numOfQuestion',
                  style: Styles.textStyle16w700.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Text(
                '${progressCount}/${totalNumber}',
                style: Styles.textStyle16w700.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppSize.getVerticalSize(15),
        ),

        /// linear progress
        Padding(
          padding: AppSize.padding(horizontal: 7),
          child: LinearProgressIndicator(
            value:  progressCount/ totalNumber,
            minHeight: AppSize.getVerticalSize(25),
            borderRadius: AppRadius.radius10,
            backgroundColor: AppColors.gryColor2.withOpacity(0.6),
            color: AppColors.secondColor,
          ),
        ),
        SizedBox(
          height: AppSize.getVerticalSize(15),
        ),

        /// question in english
        Padding(
          padding: AppSize.padding(horizontal: 7),
          child: Text(
            model.title ?? '',
            style: Styles.textStyle16w700,
          ),
        ),
        SizedBox(
          height: AppSize.getVerticalSize(2),
        ),

        /// question in arabic
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: AppSize.padding(start: 7,end: 20),
            child: Text(
              model.titleAr ?? '',
              textAlign: TextAlign.right,
              style: Styles.textStyle16w400.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppSize.getVerticalSize(15),
        ),
        // BuildChooseContainer(),
        /// Options
        BlocBuilder<AssignmentsCubit, AssignmentsState>(
          builder: (context, state) {
            var cubit =AssignmentsCubit.get(context);
            return Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) => BuildOptionContainer(
                        model: model.questionOptions[index],
                        onTap: () {
                          cubit.onSelectOption(
                              numOfQuestion-1, index,
                              model.questionOptions[index].id!,
                          );
                        }, optionLetter: cubit.numberingOptions[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: AppSize.getVerticalSize(5),
                      ),
                  itemCount: model.questionOptions.length),
            );
          },
        ),
        /// unanswered questions
        UnansweredQuestions(),
      ],
    );
  }
}

