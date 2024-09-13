import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/dependancy_injection/injection.dart';
import 'package:tdmc_project/core/utils/styles.dart';
import 'package:tdmc_project/core/widgets/custom_buttons.dart';
import 'package:tdmc_project/core/widgets/custom_error_widget.dart';
import 'package:tdmc_project/features/home/logic/home_cubit.dart';
import '../../../../core/network/local/cache/cache_helper.dart';
import '../../../../core/utils/app_navigation.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_arrow_back.dart';
import '../../../Assignments/presentation/screens/assignments_screen.dart';
import '../../data/models/workshops_model.dart';
import '../widgets/home_list_item.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.model});

  final Result model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSize.padding(horizontal: 10, top: 20),
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
                    '${CacheHelper.getData('lang')=='en'?
                    model.companyName??'':model.companyNameAr??''} ',
                    style: Styles.textStyle20w700,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.getVerticalSize(30),
              ),

              /// title text
              Text(
                CacheHelper.getData('lang')=='en'?
                model.topicName ?? '':model.topicNameAr??'',
                style: Styles.textStyle22w700,
              ),
              SizedBox(
                height: AppSize.getVerticalSize(10),
              ),
              if (model.learningOutcome == null)
                SizedBox(
                  height: AppSize.getVerticalSize(150),
                ),

              /// over all text
              if(CacheHelper.getData('lang')=='en')...[
                (model.learningOutcome != null)
                    ? Text(
                  model.learningOutcome ?? '',
                  style: Styles.grayText.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 2.3,
                  ),
                )
                    : CustomErrorWidget(
                    error: 'home.no_desc'.tr()),
              ]else...[
                (model.learningOutcomeAr != null)
                    ? Text(
                  model.learningOutcomeAr ?? '',
                  style: Styles.grayText.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 2.3,
                  ),
                )
                    : CustomErrorWidget(
                    error: 'home.no_desc'.tr()),
              ],
              SizedBox(
                height: AppSize.getVerticalSize(40),
              ),
              Spacer(),

              /// white card
              HomeListItem(
                model: model,
              ),
              SizedBox(
                height: AppSize.getVerticalSize(20),
              ),

              /// bottom buttons
              Padding(
                padding: AppSize.padding(horizontal: 15),
                child: Row(
                  children: [
                    /// assignment
                    if(model.showWorkshopAssessment==true)
                    Expanded(
                      child: CustomDefaultButton(
                        onTap: () {
                          AppNavigator.push(
                              screen: AssignmentsScreen(
                                model: model,
                              ),
                              context: context);
                        },
                        text: 'home.workshop_assessment'.tr(),
                        textStyle: Styles.textStyle12w600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if(model.showWorkshopAssessment==true&&model.canWithdraw==true)
                    SizedBox(
                      width: AppSize.getHorizontalSize(10),
                    ),
                    /// withdraw
                    if(model.canWithdraw==true)
                    BlocProvider(
                      create: (context) => getIt<HomeCubit>(),
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return Expanded(
                            child: CustomDefaultButton(
                              loading: state is Loading,
                              onTap: () {
                                HomeCubit.get(context).withdraw(context,
                                    id: model.enrollmentId!);
                              },
                              text: 'home.withdraw'.tr(),
                              textStyle: Styles.textStyle12w600.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
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
