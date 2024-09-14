import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependancy_injection/injection.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_buttons.dart';
import '../../data/models/enrollAndRejectBody.dart';
import '../../logic/notification_cubit.dart';
import '../../logic/notification_state.dart';

class DetailsActions extends StatelessWidget {
  const DetailsActions({super.key, required this.notificationId, required this.workshopId});
final String notificationId ;
final String workshopId ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<NotificationCubit>(),
      child: BlocBuilder<NotificationCubit,
          NotificationState>(
        builder: (context, state) {
          var cubit = NotificationCubit.get(context);
          return Padding(
            padding:
            AppSize.padding(horizontal: 15),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                /// enrolled
                CustomDefaultButton(
                  loading: state is LoadingEnroll,
                  onTap: () {
                    cubit.enrollAndReject(
                      context,
                      EnrollAndRejectBody(
                          id: notificationId,
                          workshopId:workshopId,
                          rejectReason: "",
                          status: 1),
                    );
                  },
                  text:
                  'notifications.enroll'.tr(),
                  width:
                  AppSize.getHorizontalSize(
                      111),
                  height:
                  AppSize.getVerticalSize(44),
                  textStyle: Styles
                      .textStyle16w700
                      .copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width:
                  AppSize.getHorizontalSize(
                      15),
                ),

                /// rejected
                CustomDefaultButton(
                  loading: state is LoadingReject,
                  onTap: () {
                    cubit.enrollAndReject(
                      context,
                      EnrollAndRejectBody(
                          id: notificationId,
                          workshopId: workshopId,
                          rejectReason: "",
                          status: 2),
                    );
                  },
                  text:
                  'notifications.reject'.tr(),
                  bgColor: Colors.white,
                  width:
                  AppSize.getHorizontalSize(
                      111),
                  height:
                  AppSize.getVerticalSize(44),
                  textStyle: Styles
                      .textStyle16w700
                      .copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
