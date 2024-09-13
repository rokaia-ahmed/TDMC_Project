import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/dependancy_injection/injection.dart';
import 'package:tdmc_project/core/widgets/custom_error_widget.dart';
import 'package:tdmc_project/core/widgets/custom_loading.dart';
import 'package:tdmc_project/features/notifications/logic/notification_cubit.dart';
import '../../../../core/utils/app_size.dart';
import '../widgets/invitation_item.dart';
import '../widgets/invitations_container.dart';

class NotificationInvitation extends StatelessWidget {
  const NotificationInvitation({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotificationCubit>()..getInvitations(id),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: AppSize.getVerticalSize(5),
              ),
              /// top container
              InvitationsContainer(),
              BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  var cubit = NotificationCubit.get(context);
                  if(state is Loading){
                    return CustomLoading();
                  }else if(state is Success){
                    if(cubit.invitations.isNotEmpty){
                      return Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            padding: AppSize.padding(all: 20),
                            itemBuilder: (context, index) =>
                                InvitationItem(
                                    model:cubit.invitations[index],
                                  notificationId:id ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: AppSize.getVerticalSize(10),
                            ),
                            itemCount: cubit.invitations.length),
                      );
                    }else{
                      return CustomErrorWidget(
                          error:'notifications.no_invitation'.tr()
                      );
                    }
                  }else if(state is Error){
                    return CustomErrorWidget(
                        error:state.errorMsg );
                  }else{
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

