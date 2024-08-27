import 'package:flutter/material.dart';
import 'package:tdmc_project/core/utils/styles.dart';
import 'package:tdmc_project/core/widgets/custom_buttons.dart';
import 'package:tdmc_project/core/widgets/custom_error_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_navigation.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_arrow_back.dart';
import '../../../Assignments/presentation/screens/assignments_screen.dart';
import '../../data/models/workshops_model.dart';
import '../widgets/home_list_item.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key,required this.model});
  final Result model ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSize.padding(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// top row
              Row(
                children: [
                  CustomArrowBack(),
                  SizedBox(
                    width: AppSize.getHorizontalSize(10),
                  ),
                  Text(
                    '${model.companyName??''} ',
                    style: Styles.textStyle20w700,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.getVerticalSize(40),
              ),

              /// title text
              Text(
                model.topicName??'',
                style: Styles.textStyle22w700,
              ),
              SizedBox(
                height: AppSize.getVerticalSize(10),
              ),
              if(model.learningOutcome ==null)
              SizedBox(
                height: AppSize.getVerticalSize(150),
              ),
              /// over all text
              (model.learningOutcome !=null)?
              Text(
                model.learningOutcome??'',
                style: Styles.grayText.copyWith(
                  fontWeight: FontWeight.w400,
                  height: 2.3,
                ),
              ):
                  CustomErrorWidget(
                      error: 'There\'s no description found for this workshop'),
              SizedBox(
                height: AppSize.getVerticalSize(40),
              ),
               Spacer(),
              /// white card
              HomeListItem(model: model,),
              SizedBox(
                height: AppSize.getVerticalSize(20),
              ),

              /// bottom buttons
              Padding(
                padding: AppSize.padding(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomDefaultButton(
                        onTap: () {
                          AppNavigator.push(
                              screen: AssignmentsScreen(),
                              context: context);
                        },
                        text: 'Workshop Assessment',
                        textStyle: Styles.textStyle12w600.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppSize.getHorizontalSize(10),
                    ),
                    Expanded(
                      child: CustomDefaultButton(
                        onTap: () {},
                        text: 'Withdraw',
                        textStyle: Styles.textStyle12w600.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.getVerticalSize(40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
