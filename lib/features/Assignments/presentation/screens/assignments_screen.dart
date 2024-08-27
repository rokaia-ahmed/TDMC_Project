import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/widgets/custom_buttons.dart';
import 'package:tdmc_project/features/Assignments/logic/assignments_cubit.dart';
import '../../../../core/utils/app_size.dart';
import '../widgets/page_view_item.dart';
import '../widgets/top_widgets.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<num> list = [1,2,3,4,5,6,7,8];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSize.padding(horizontal: 15, vertical: 10),
          child: BlocProvider(
            create: (context) => AssignmentsCubit(),
            child: BlocBuilder<AssignmentsCubit,AssignmentsState>(
              builder: (context, state){
                var cubit = AssignmentsCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// top tiles
                    TopTitlesWidget(),
                    SizedBox(
                      height: AppSize.getVerticalSize(10),
                    ),
                    Flexible(
                      child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        controller:cubit.pageController,
                        padEnds: false,
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context,index){
                          return PageViewItem(index: index,);
                        } ,
                        itemCount: list.length,
                      ),
                    ),

                    /// buttons row
                    Row(
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
                                  duration: Duration(milliseconds:2),
                                  curve: Curves.easeInOut,
                              );
                            },
                            text: 'Previous'),
                        SizedBox(width: AppSize.getHorizontalSize(10),),
                        CustomDefaultButton(
                            elevation: 1.5,
                            height: AppSize.getVerticalSize(30),
                            width: AppSize.getHorizontalSize(80),
                            onTap: (){
                              cubit.pageController.nextPage(
                                  duration: Duration(milliseconds:1),
                                  curve:  Curves.easeInOut);
                            },
                            text: 'Next'),
                      ],
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
