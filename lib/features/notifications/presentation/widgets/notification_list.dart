import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/widgets/custom_error_widget.dart';
import 'package:tdmc_project/core/widgets/custom_loading.dart';
import 'package:tdmc_project/features/notifications/logic/notification_cubit.dart';
import '../../../../core/utils/app_navigation.dart';
import '../screens/notification_invitation.dart';
import 'notification_list_item.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit,NotificationState>(
      builder: (context, state) {
        var cubit =NotificationCubit.get(context);
        if(state is Loading){
          return CustomLoading();
        }else if(state is Success){
          if(cubit.notification.isNotEmpty){
            return Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      NotificationListItem(
                        model: cubit.notification[index],
                        onTap: () {
                       cubit.makeRead(
                           cubit.notification[index].id!,index);
                        if(cubit.notification[index].type==5){
                          AppNavigator.push(
                              screen: NotificationInvitation(id:
                             // '72BA4502-9DAB-4DAD-98AE-C0D8330E1F2C'
                               cubit.notification[index].entityId! ,
                              ),
                              context: context);
                        }
                      },
                      ),
                  separatorBuilder: (context, index) =>
                      SizedBox(
                        height: AppSize.getVerticalSize(20),
                      ),
                  itemCount: cubit.notification.length),
            );
          }else{
            return CustomErrorWidget(
                error: 'notifications.no_notification'.tr());
          }
        }else if(state is Error){
          return CustomErrorWidget(
              error: state.errorMsg);
        }else{
          return Container();
        }
      },
    );
  }
}
