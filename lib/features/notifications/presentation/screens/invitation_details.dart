import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/dependancy_injection/injection.dart';
import 'package:tdmc_project/core/network/local/cache/cache_helper.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/features/notifications/data/models/enrollAndRejectBody.dart';
import 'package:tdmc_project/features/notifications/logic/notification_cubit.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_arrow_back.dart';
import '../../../../core/widgets/custom_buttons.dart';
import '../../data/models/invitations_model.dart';

class InvitationDetails extends StatelessWidget {
  const InvitationDetails({super.key,
    required this.model,
    required this.notificationId});

  final InvitationModel model;
  final String notificationId;
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
                  /*SizedBox(
                    width: AppSize.getHorizontalSize(10),
                  ),
                  Text(
                    '${model.companyName ?? ''} ',
                    style: Styles.textStyle20w700,
                  ),*/
                ],
              ),
              SizedBox(
                height: AppSize.getVerticalSize(30),
              ),

              /// title text
              Text(
                CacheHelper.getData('lang') == 'en'
                    ? model.title ?? ''
                    : model.titleAr ?? '',
                style: Styles.textStyle22w700,
              ),
              SizedBox(
                height: AppSize.getVerticalSize(10),
              ),
              /* if (model.learningOutcome == null)
                SizedBox(
                  height: AppSize.getVerticalSize(150),
                ),

              /// over all text
              (model.learningOutcome != null)
                  ? Text(
                      model.learningOutcome ?? '',
                      style: Styles.grayText.copyWith(
                        fontWeight: FontWeight.w400,
                        height: 2.3,
                      ),
                    )
                  : CustomErrorWidget(error: 'home.no_desc'.tr()),*/
              SizedBox(
                height: AppSize.getVerticalSize(40),
              ),
              Spacer(),

              /*/// white card
              HomeListItem(
                model: model,
              ),*/
              SizedBox(
                height: AppSize.getVerticalSize(20),
              ),

              /// bottom buttons

              BlocProvider(
                create: (context) => getIt<NotificationCubit>(),
                child: BlocBuilder<NotificationCubit, NotificationState>(
                  builder: (context, state) {
                    var cubit = NotificationCubit.get(context);
                    return Padding(
                      padding: AppSize.padding(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// enrolled
                          CustomDefaultButton(
                            loading: state is LoadingEnroll,
                            onTap: () {
                              cubit.enrollAndReject(context,EnrollAndRejectBody(
                                  id: notificationId,
                                  workshopId: model.id!,
                                  rejectReason: "",
                                  status: 1),
                              );
                            },
                            text: 'notifications.enroll'.tr(),
                            width: AppSize.getHorizontalSize(111),
                            height: AppSize.getVerticalSize(44),
                            textStyle: Styles.textStyle16w700.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: AppSize.getHorizontalSize(15),
                          ),

                          /// rejected
                          CustomDefaultButton(
                             loading: state is LoadingReject,
                            onTap: () {
                              cubit.enrollAndReject(context,EnrollAndRejectBody(
                                  id: notificationId,
                                  workshopId: model.id!,
                                  rejectReason: "",
                                  status: 2),
                              );
                            },
                            text: 'notifications.reject'.tr(),
                            bgColor: Colors.white,
                            width: AppSize.getHorizontalSize(111),
                            height: AppSize.getVerticalSize(44),
                            textStyle: Styles.textStyle16w700.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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
