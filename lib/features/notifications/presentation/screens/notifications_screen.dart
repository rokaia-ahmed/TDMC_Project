import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/dependancy_injection/injection.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/utils/styles.dart';
import 'package:tdmc_project/core/widgets/custom_arrow_back.dart';
import 'package:tdmc_project/features/notifications/logic/notification_cubit.dart';
import '../../logic/notification_state.dart';
import '../widgets/notification_list.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSize.padding(
            all: 15,
          ),
          child: BlocProvider(
            create: (context) => getIt<NotificationCubit>()..getNotification(),
            child: BlocBuilder<NotificationCubit, NotificationState>(
              builder: (context, state) {
                var cubit = NotificationCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomArrowBack(),
                    SizedBox(
                      height: AppSize.getVerticalSize(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'notifications.title'.tr(),
                          style: Styles.textStyle24w600,
                        ),
                        InkWell(
                          onTap: () {
                            cubit.makeAllRead();
                          },
                          child: Card(
                            elevation: 3,
                            shape:OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)),
                              borderSide: BorderSide.none,
                            ) ,
                            child: Padding(
                              padding:
                                  AppSize.padding(vertical: 7, horizontal: 17),
                              child: Text(
                                'notifications.make_read'.tr(),
                                style: Styles.textStyle16w700.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (cubit.notification.isNotEmpty)
                      Row(
                        children: [
                          Text(
                            'notifications.you_have'.tr(),
                            style: Styles.textStyle14w400.copyWith(
                              color: AppColors.gryTextColor,
                            ),
                          ),
                          SizedBox(
                            width: AppSize.getHorizontalSize(5),
                          ),
                          Text(
                            '${cubit.notification.length} ${'notifications.title'.tr()} .',
                            style: Styles.textStyle14w400.copyWith(
                              color: AppColors.secondColor,
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: AppSize.getVerticalSize(20),
                    ),
                    NotificationList(),
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
