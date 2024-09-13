import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/core/utils/app_navigation.dart';
import 'package:tdmc_project/core/utils/helper/app_dialogs.dart';
import 'package:tdmc_project/features/layout/presentation/screens/layout_screen.dart';
import 'package:tdmc_project/features/notifications/data/models/enrollAndRejectBody.dart';
import 'package:tdmc_project/features/notifications/data/models/invitations_model.dart';
import 'package:tdmc_project/features/notifications/data/models/notification_model.dart';

import '../data/repos/notification_repo.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.repo) : super(NotificationInitial());
  NotificationRepo repo ;
  static NotificationCubit get(context)=>BlocProvider.of(context);

  /// get notification
  List<NotificationModel> notification =[];
  void getNotification() async {
    emit(Loading());
    await repo.getNotification().then((value) {
      value.fold((l) {
        debugPrint(l.message);
        emit(Error(l.message));
      }, (r) {
        notification = r;
        emit(Success());
      });
    });
  }

  /// get invitations
  List<InvitationModel> invitations =[];
  void getInvitations(String id) async {
    emit(Loading());
    await repo.getInvitation(id).then((value) {
      value.fold((l) {
        debugPrint(l.message);
        emit(Error(l.message));
      }, (r) {
        invitations = r;
        emit(Success());
      });
    });
  }

  /// make notification read
  void makeRead(String id,index) async {
    emit(Loading());
      await repo.markRead(id
      ).then((value) {
        value.fold((l) {
          emit(Error(l.message));
        }, (r) {
          getNotification();
          //notification[index].isRead=true ;
          emit(Success());
        });
      });
  }

  /// make notification read
  void makeAllRead() async {
    emit(Loading());
    await repo.markAllRead().then((value) {
      value.fold((l) {
        emit(Error(l.message));
      }, (r) {
        getNotification();
        emit(Success());
      });
    });
  }

  /// enroll And Reject
  void enrollAndReject(BuildContext context,
      EnrollAndRejectBody model) async {
    if(model.status==1){
      emit(LoadingEnroll());
    }else{
      emit(LoadingReject());
    }
    await repo.enrolledOrReject(model).then((value) {
      value.fold((l) {
        AppDialogs.toast(
            msg: l.message,
            state: ToastStates.error);
        emit(Error(l.message));
      }, (r) {
        AppNavigator.push(
            screen: LayoutScreen(),
            context: context);
        emit(Success());
      });
    });
  }

}
