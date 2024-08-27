import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/features/Auth/data/repos/auth_repo.dart';
import '../../../core/utils/app_navigation.dart';
import '../../../core/utils/helper/app_dialogs.dart';
import '../../../core/utils/helper/app_helper.dart';
import '../../layout/presentation/screens/layout_screen.dart';
import '../presentation/screens/otp_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.repo) : super(AuthInitial());
  AuthRepo repo;

  static AuthCubit get(context) => BlocProvider.of(context);

  /// form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var cadeCountryController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  bool isSecure = true;
  void changePassVisibility() {
    isSecure = !isSecure;
    emit(AuthInitial());
  }

  String countryCode = '+20';

  void onChangeCountry(String code, String? name) {
    cadeCountryController = TextEditingController();
    countryCode = code;
    cadeCountryController.text = name ?? '';
    emit(Success());
  }

  /// login
  void login(context) async {
    await AppHelper.closeKeyboard();
    if (formKey.currentState!.validate()) {
      emit(Loading());
      await repo.login(countryCode + phoneController.text).then((value) {
        value.fold((l) {
          AppDialogs.toast(
            msg: l.message,
            state: ToastStates.error,
          );
          emit(Error());
        }, (r) {
          AppNavigator.push(
              screen: OtpScreen(
                phone: countryCode + phoneController.text,
              ),
              context: context);
          emit(Success());
        });
      });
    }
  }
   bool isValidate = true ;
  /// otp
  void otp(context, String phone) async {
    await AppHelper.closeKeyboard();
    if (!formKey.currentState!.validate()){
      isValidate = false ;
      return ;
    };
    emit(Loading());
    final result = await repo.otp(phone, otpController.text);
    result.fold((l) {
      AppDialogs.toast(
        msg: l.message,
        state: ToastStates.error,
      );
      emit(Error());
    }, (r) {
      stopCountdown();
      AppNavigator.pushAndRemove(
          screen: const LayoutScreen(), context: context);
      emit(Success());
    });

  }

  /// count down
  Timer? _countdownTimer;
  int count = 30;
  void startCountdown() {
    // Ensure any existing timer is canceled before starting a new one
    _countdownTimer?.cancel();
    count = 30;

    // Emit initial countdown state
    emit(CountdownTick(count));

    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        count--;
        emit(CountdownTick(count));
      } else {
        timer.cancel();
        emit(CountdownComplete());
      }
    });
  }
  /// stop count
  void stopCountdown() {
    count = 0 ;
    if (_countdownTimer != null && _countdownTimer!.isActive) {
      _countdownTimer!.cancel();
    //  emit(CountdownStopped());
    }
  }
  /// resend otp
  void resendOtp(context, String phone) async {
    emit(LoadingOtp());
    await repo.resentOtp(phone).then((value) {
      value.fold((l) {
        /// down count 30 seconds
        startCountdown();
        AppDialogs.toast(msg: l.message, state: ToastStates.error);
        emit(Error());
      }, (r) {
        /// down count 30 seconds
        startCountdown();
        emit(Success());
      });
    });
  }
}
