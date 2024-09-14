import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_navigation.dart';
import '../../../core/utils/helper/app_dialogs.dart';
import '../../layout/presentation/screens/layout_screen.dart';
import '../data/models/details_check_model.dart';
import '../data/models/enrollAndRejectBody.dart';
import '../data/models/invitations_details_model.dart';
import '../data/models/invitations_model.dart';
import '../data/models/notification_model.dart';
import '../data/repos/notification_repo.dart';
import '../presentation/screens/invitation_details.dart';
import '../presentation/screens/notification_invitation.dart';
import 'notification_state.dart';



class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.repo) : super(NotificationInitial());
  NotificationRepo repo;
  static NotificationCubit get(context) => BlocProvider.of(context);

  /// get notification
  List<NotificationModel> notification = [];
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
  List<InvitationModel> invitations = [];
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
  void makeRead(String id, index) async {
    emit(Loading());
    await repo.markRead(id).then((value) {
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
  void enrollAndReject(BuildContext context, EnrollAndRejectBody model) async {
    if (model.status == 1) {
      emit(LoadingEnroll());
    } else {
      emit(LoadingReject());
    }
    await repo.enrolledOrReject(model).then((value) {
      value.fold((l) {
        AppDialogs.toast(msg: l.message, state: ToastStates.error);
        emit(Error(l.message));
      }, (r) {
        AppNavigator.push(screen: LayoutScreen(), context: context);
        emit(Success());
      });
    });
  }

  /// get Invitations Details
  InvitationsDetailsModel? DetailsModel;
  void getInvitationsDetails(String id) async {
    emit(Loading());
    await repo.getInvitationsDetails(id).then((value) {
      value.fold((l) {
        debugPrint(l.message);
        emit(Error(l.message));
      }, (r) {
        DetailsModel = r;
        emit(Success());
      });
    });
  }

  /// get check Details
  DetailsCheckModel? detailsCheckModel;

  void getCheckDetails(String id) async {
    emit(Loading());
    await repo.getInvitationsDetailsIfWork(id).then((value) {
      value.fold((l) {
        debugPrint(l.message);
        emit(Error(l.message));
      }, (r) {
        detailsCheckModel = r;
        emit(Success());
      });
    });
  }

  void whenNavigate(context, {required int index}) {
    // mark notification as read
    makeRead(notification[index].id!, index);

    // check where go
    if (notification[index].type == 1 || notification[index].type == 2) {
      AppNavigator.push(
          screen: InvitationDetails(
            notificationId: notification[index].id!,
            entityId: notification[index].entityId!,
            type: 1,
          ),
          context: context);
    } else if (notification[index].type == 3) {
      AppNavigator.push(
          screen: InvitationDetails(
            notificationId: notification[index].id!,
            entityId: notification[index].entityId!,
            type: 3,
          ),
          context: context);
    } else if (notification[index].type == 4) {
      /*AppNavigator.push(
           screen: AssignmentsScreen(model: null,),
           context: context);*/
    } else if (notification[index].type == 5) {
      getCheckDetails(notification[index].id!);
      if (detailsCheckModel != null) {
          if(detailsCheckModel!.workshopsGroupId !=null){
            AppNavigator.push(
                screen:
                NotificationInvitation(
                  entityId: notification[index].entityId!,
                  notificationId:notification[index].id!,
                ),
                context: context);
          }else{
            AppNavigator.push(
                screen:
                InvitationDetails(
                  entityId: notification[index].entityId!,
                  notificationId:notification[index].id!,
                  type: 5),
                context: context);
          }
      }
    }
  }
}
