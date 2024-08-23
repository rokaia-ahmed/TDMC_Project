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
      await repo.login(countryCode+phoneController.text).then((value) {
        value.fold((l) {
          AppDialogs.toast(
            msg: l.message,
            state: ToastStates.error,
          );
          emit(Error());
        }, (r) {
          AppDialogs.toast(
              msg: 'login is successfully', state: ToastStates.success);
          AppNavigator.push(
              screen: OtpScreen(
                phone: countryCode+phoneController.text,
              ),
              context: context);
          emit(Success());
        });
      });
    }
  }

  /// otp
  void otp(context, String phone) async {
    await AppHelper.closeKeyboard();
    if (formKey.currentState!.validate()) {
      emit(Loading());
      await repo.otp(phone, otpController.text).then((value) {
        value.fold((l) {
          AppDialogs.toast(
            msg: l.message,
            state: ToastStates.error,
          );
          downCount();
          emit(Error());
        }, (r) {
          AppDialogs.toast(
              msg: 'verify code is successfully', state: ToastStates.success);
          AppNavigator.pushAndRemove(screen: const LayoutScreen(),
              context: context);
          emit(Success());
        });
      });
    }
  }
    /// count down
  int count = 30;
  void downCount() async {
    count = 30;
    while (count > 0) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      count--;
      emit(AuthInitial());
    }
  }

  /// resend otp
  void resendOtp(context, String phone) async {
    emit(Loading());
    await repo.resentOtp(phone).then((value) {
      value.fold((l) {
        /// down count 30 seconds
        downCount();
        AppDialogs.toast(msg: l.message, state: ToastStates.error);
        emit(Error());
      }, (r) {
        /// down count 30 seconds
        downCount();
        AppDialogs.toast(
            msg: 'OTP resend successfully',
            state: ToastStates.success);
        emit(Success());
      });
    });
  }
}
