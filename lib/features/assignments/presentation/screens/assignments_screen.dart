import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/dependancy_injection/injection.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/widgets/custom_buttons.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../home/data/models/workshops_model.dart';
import '../../logic/assignments_cubit.dart';
import '../widgets/page_view_item.dart';
import '../widgets/top_widgets.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key, required this.model});
  final Result model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSize.padding(horizontal: 10,
              vertical: 10),
          child: BlocProvider(
            create: (context) => getIt<AssignmentsCubit>()..getQuestions(),
            child: BlocBuilder<AssignmentsCubit, AssignmentsState>(
              builder: (context, state) {
                var cubit = AssignmentsCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// top tiles
                    TopTitlesWidget(
                      model: model,
                    ),
                    if(state is !Error)
                    SizedBox(
                      height: AppSize.getVerticalSize(20),
                    ),
                    /// page view

                    if (state is Success) ...[
                      Expanded(
                        child: PageView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          controller: cubit.pageController,
                          padEnds: false,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            cubit.currentPage =index ;
                            return PageViewItem(model:
                            cubit.questions[index],
                              numOfQuestion: index+1,
                              totalNumber: cubit.questions.length,
                              progressCount: cubit.count,);
                          },
                          itemCount: cubit.questions.length,
                        ),
                      ),
                    ] else if (state is Loading) ...[
                      CustomLoading(),
                    ] else if(state is Error) ...[
                      CustomErrorWidget(error:state.errorMsg),
                    ],

                    /// buttons row
                    if(state is Success)
                    Padding(
                      padding:AppSize.padding(horizontal: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomDefaultButton(
                              textColor: AppColors.primaryColor,
                              bgColor: Colors.white,
                              elevation: 1.5,
                              height: AppSize.getVerticalSize(30),
                              width: AppSize.getHorizontalSize(60),
                              onTap: () {
                                  cubit.pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                              },
                              text: 'Previous'),
                          SizedBox(
                            width: AppSize.getHorizontalSize(10),
                          ),
                          CustomDefaultButton(
                              elevation: 1.5,
                              height: AppSize.getVerticalSize(30),
                              width: AppSize.getHorizontalSize(80),
                              onTap:() {
                                cubit.addMapValueToList();

                                cubit.pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);

                                cubit.addUnansweredToList(cubit.currentPage);

                                if(cubit.questions.length==
                                    cubit.currentPage+1&& cubit.optionsId.isNotEmpty){
                                  cubit.submitAssignment(
                                      context,
                                      id:model.enrollmentId!,);
                                }
                              },
                              text: 'Next'),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
