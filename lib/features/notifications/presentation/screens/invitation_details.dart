import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/dependancy_injection/injection.dart';
import 'package:tdmc_project/core/network/local/cache/cache_helper.dart';
import 'package:tdmc_project/core/widgets/custom_loading.dart';
import 'package:tdmc_project/features/notifications/logic/notification_cubit.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_arrow_back.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../logic/notification_state.dart';
import '../widgets/details_actions.dart';
import '../widgets/details_card.dart';

class InvitationDetails extends StatelessWidget {
  const InvitationDetails(
      {super.key,
      required this.notificationId,
      required this.entityId,
      required this.type});

  final String notificationId;
  final String entityId;
  final int type;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<NotificationCubit>()..getInvitationsDetails(entityId),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          var cubit = NotificationCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                  padding: AppSize.padding(horizontal: 10, top: 20),
                  child: (state is Loading)
                      ? CustomLoading2()
                      : (state is Success)
                          ? Column(
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
                                      CacheHelper.getData('lang') == 'en'
                                          ? '${cubit.DetailsModel!.companyName ?? ''} '
                                          : '${cubit.DetailsModel!.companyNameAr ?? ''} ',
                                      style: Styles.textStyle20w700,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppSize.getVerticalSize(30),
                                ),

                                /// title text
                                Text(
                                  CacheHelper.getData('lang') == 'en'
                                      ? cubit.DetailsModel!.topicName ?? ''
                                      : cubit.DetailsModel!.topicNameAr ?? '',
                                  style: Styles.textStyle22w700,
                                ),
                                SizedBox(
                                  height: AppSize.getVerticalSize(10),
                                ),
                                if (cubit.DetailsModel!.learningOutcome == null)
                                  SizedBox(
                                    height: AppSize.getVerticalSize(150),
                                  ),

                                /// over all text
                                if (CacheHelper.getData('lang') == 'en') ...[
                                  (cubit.DetailsModel!.learningOutcome != null)
                                      ? Text(
                                          cubit.DetailsModel!.learningOutcome ??
                                              '',
                                          style: Styles.grayText.copyWith(
                                            fontWeight: FontWeight.w400,
                                            height: 2.3,
                                          ),
                                        )
                                      : CustomErrorWidget(
                                          error: 'home.no_desc'.tr()),
                                ] else ...[
                                  (cubit.DetailsModel!.learningOutcomeAr !=
                                          null)
                                      ? Text(
                                          cubit.DetailsModel!
                                                  .learningOutcomeAr ??
                                              '',
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
                                DetailsCard(
                                  model: cubit.DetailsModel!,
                                ),
                                SizedBox(
                                  height: AppSize.getVerticalSize(20),
                                ),

                                /// bottom buttons
                                if (type == 3 || type == 5)
                                  DetailsActions(
                                    notificationId: notificationId,
                                    workshopId: entityId),

                                SizedBox(
                                  height: AppSize.getVerticalSize(40),
                                ),
                              ],
                            )
                          : (state is Error)
                              ? CustomError2(error: state.errorMsg)
                              : Container()),
            ),
          );
        },
      ),
    );
  }
}
